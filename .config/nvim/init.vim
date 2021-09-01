call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nanotech/jellybeans.vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()

set termguicolors
colorscheme jellybeans

set hidden
set noruler
set cursorline
set scrolloff=7
set showtabline=2
set clipboard+=unnamedplus

set hlsearch
set incsearch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab

lua << EOF
require'colorizer'.setup()
require('nvim-autopairs').setup {}
require('nvim-autopairs').setup {}

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

EOF
