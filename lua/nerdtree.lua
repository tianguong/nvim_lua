-- Nerd翻译 ----------------
-- https://github.com/scrooloose/nerdtree/issues/953#issuecomment-465148857
-- autocmd ColorScheme * highlight NERDTreeFile ctermfg=251
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  command = 'highlight NERDTreeFile ctermfg=251'
})
-- 针对普通窗口
-- https://github.com/neovim/neovim/issues/9019#issuecomment-446514216
-- autocmd ColorScheme * highlight Normal ctermbg=NONE
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  command = 'highlight Normal ctermbg=NONE'
})

-- 按下 Ctrl +  调出/隐藏 NERDTree
vim.keymap.set('n', '<F2>', ':NERDTreeToggle<CR>')
