vim.cmd [[
" -- ----------------fzf---------------------------------------
" -- Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" -- Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" -- ---------------vim-multiple-cursors-----------------------
let g:multi_cursor_use_default_mapping=0

" -- Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
]]
