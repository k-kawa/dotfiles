call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1
Plug 'stephpy/vim-yaml'
Plug 'scrooloose/nerdtree'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'vim-ruby/vim-ruby'
Plug 'fishbullet/deoplete-ruby'
call plug#end()
set expandtab
set tabstop=2
set shiftwidth=2
set number
set autowrite
set wildmenu
set wildmode=list:longest,full
let mapleader = "\<Space>"
nmap <F8> :NERDTreeToggle<CR>
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
augroup md_augroup
  autocmd!
  " Disable folding.
  autocmd FileType markdown set nofoldenable
augroup END
augroup go_augroup
  autocmd!
  " Use tab
  autocmd FileType go set noexpandtab
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>n  :cnext<CR>
  autocmd FileType go nmap <leader>p  :cprevious<CR>
augroup END
