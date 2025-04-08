-- 高亮显示光标所在的当前行
vim.opt.cursorline = true

-- 在终端中使用真彩色
vim.opt.termguicolors = true

-- 有补全选项时，将显示一个带有可用选择的弹出菜单
vim.opt.wildoptions = 'pum'

-- 弹出菜单的透明度，5是稍微透明，最大值100（全透明）
-- vim.opt.pumblend = 5

-- 背景颜色方案设置为"dark"，插件、颜色和语法高亮将针对暗背景进行优化。
-- vim.opt.background = 'dark'
-- 语法高亮
vim.opt.syntax = on 

local api = vim.api

local M = {}

-- Get single line extmarks
function M.getHighlights(bufnr, key, s, e)
  if not api.nvim_buf_is_loaded(bufnr) then
    return nil
  end
  s = s or 0
  e = e or -1
  local max = e == -1 and api.nvim_buf_line_count(bufnr) or e + 1
  local ns = api.nvim_create_namespace('coc-' .. key)
  local markers = api.nvim_buf_get_extmarks(bufnr, ns, {s, 0}, {e, -1}, {details = true})
  local res = {}
  for _, mark in ipairs(markers) do
    local id = mark[1]
    local line = mark[2]
    local startCol = mark[3]
    local details = mark[4]
    local endCol = details.end_col
    if line < max then
      local delta = details.end_row - line
      if delta <= 1 and (delta == 0 or endCol == 0) then
        if startCol == endCol then
          api.nvim_buf_del_extmark(bufnr, ns, id)
        else
          if delta == 1 then
            local text = api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1] or ''
            endCol = #text
          end
          table.insert(res, {details.hl_group, line, startCol, endCol, id})
        end
      end
    end
  end
  return res
end

local function addHighlights(bufnr, ns, highlights, priority)
  for _, items in ipairs(highlights) do
    local hlGroup = items[1]
    local line = items[2]
    local startCol = items[3]
    local endCol = items[4]
    local hlMode = items[5] and 'combine' or 'replace'
    -- Error: col value outside range
    pcall(api.nvim_buf_set_extmark, bufnr, ns, line, startCol, {
          end_col = endCol,
          hl_group = hlGroup,
          hl_mode = hlMode,
          right_gravity = true,
          priority = type(priority) == 'number' and math.min(priority, 4096) or 4096
    })
  end
end

local function addHighlightTimer(bufnr, ns, highlights, priority, maxCount)
  local hls = {}
  local next = {}
  for i, v in ipairs(highlights) do
    if i < maxCount then
      table.insert(hls, v)
    else
      table.insert(next, v)
    end
  end
  addHighlights(bufnr, ns, hls, priority)
  if #next > 0 then
    vim.defer_fn(function()
      addHighlightTimer(bufnr, ns, next, priority, maxCount)
    end, 30)
  end
end

function M.set(bufnr, ns, highlights, priority)
  local maxCount = vim.g.coc_highlight_maximum_count
  if #highlights > maxCount then
    addHighlightTimer(bufnr, ns, highlights, priority, maxCount)
  else
    addHighlights(bufnr, ns, highlights, priority)
  end
end

return M
