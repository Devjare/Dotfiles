call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSV Rainbow
Plug 'mechatroner/rainbow_csv'

" Nerdtree and extentions.
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


Plug 'sirver/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'

Plug 'bling/vim-bufferline'

Plug 'vim-scripts/vim-gitgutter'

Plug 'psliwka/vim-smoothie'

" Vim Script
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" Markdown-preview
Plug 'iamcco/markdown-preview.nvim' ", { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}

" vim-relativize, show line numbers relative
Plug 'ericbn/vim-relativize'

call plug#end()

" Airline
let g:airline_theme='wombat'

" Bufferline config
let g:bufferline_show_bufnr = 1

let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

" Auto init NERDTree
au VimEnter *  NERDTree

" Close buffer without closing all other buffers open.
" use '\d' to close current buffer.
nnoremap \d :bp<cr>:bd #<cr>

" Go to next buffer
nnoremap \n :bn<cr>

" TODO Config
"lua << EOF
"  require("todo-comments").setup {
"  } 
"EOF
"
set autoindent
set noexpandtab
set list

set shiftwidth=4
set tabstop=4

set relativenumber
