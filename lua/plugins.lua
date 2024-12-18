local vim = vim
local Plug = vim.fn['plug#']
-- https://junegunn.github.io/vim-plug/example-lua/
-- vmhgfs-fuse cpu too high, because of installed coc-go, so cocuninstall it will be resolve.
vim.call('plug#begin')

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
-- Plug('junegunn/seoul256.vim')
-- Any valid git URL is allowed
Plug('https://github.com/junegunn/vim-easy-align.git')
-- Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
-- Plug('fatih/vim-go', { ['tag'] = '*' })
-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
-- Plug('neoclide/coc.nvim', { ['branch'] = 'master', ['do'] = 'npm ci'})
-- Plug('ibhagwan/fzf-lua', { ['branch'] = 'main'})

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- optional for icon support
Plug('nvim-tree/nvim-web-devicons')
-- or if using mini.icons/mini.nvim
-- Plug 'echasnovski/mini.icons'
Plug('junegunn/gv.vim')
-- If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
-- Plug('nsf/gocode', { ['rtp'] = 'vim' })
-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
-- On-demand loading: loaded when a file with a specific file type is opened
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })
Plug('tpope/vim-fugitive')
-- Unmanaged plugin (manually installed and updated)
-- Plug('~/my-prototype-plugin')
-- Plug('buoto/gotests-vim')
Plug('sebdah/vim-delve')
Plug('terryma/vim-multiple-cursors')
Plug('vim-airline/vim-airline')
-- airline 的主题
Plug('vim-airline/vim-airline-themes')
Plug('preservim/tagbar')
-- Plug 'projekt0n/github-nvim-theme'
Plug('tomasr/molokai')
-- Plug 'dense-analysis/ale'                                                                                                                                                                   


vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
-- vim.cmd('silent! colorscheme seoul256')
--

