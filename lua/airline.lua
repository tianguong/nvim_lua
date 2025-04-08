
-- --------------------airline-------------------------
-- 设置状态栏
vim.cmd [[
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"
]]

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
-- 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
vim.keymap.set('n', '<leader>1', '<Plug>AirlineSelectTab1')
vim.keymap.set('n', '<leader>2', '<Plug>AirlineSelectTab2')
vim.keymap.set('n', '<leader>3', '<Plug>AirlineSelectTab3')
vim.keymap.set('n', '<leader>4', '<Plug>AirlineSelectTab4')
vim.keymap.set('n', '<leader>5', '<Plug>AirlineSelectTab5')
vim.keymap.set('n', '<leader>6', '<Plug>AirlineSelectTab6')
vim.keymap.set('n', '<leader>7', '<Plug>AirlineSelectTab7')
vim.keymap.set('n', '<leader>8', '<Plug>AirlineSelectTab8')
vim.keymap.set('n', '<leader>9', '<Plug>AirlineSelectTab9')
-- 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
vim.keymap.set('n', 'leader>-', '<Plug>AirlineSelectPrevTab')
-- 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
vim.keymap.set('n', 'leader>+', '<Plug>AirlineSelectNextTab')
-- 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
vim.keymap.set('n', 'leader>q', ':bp<cr>:bd #<cr>')

-- let g:coc_enable_locationlist = 0
-- autocmd User CocLocationsChange CocList --no-quit --normal location

-- nnoremap <A-l> :bnext<cr>
vim.keymap.set('n', '<A-l>', ':bnext<cr>')
-- nnoremap <A-h> :bprevious<cr>
vim.keymap.set('n', '<A-h>', ':bprevious<cr>')


-- 修改了一些个人不喜欢的字符
-- if vim.g.airline_symbols == nil then
    -- vim.g.airline_symbols = {}
-- end
