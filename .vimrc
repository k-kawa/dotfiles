set expandtab
set tabstop=2
set shiftwidth=2
set number
set autowrite
set wildmenu
set wildmode=list:longest,full
let mapleader = "\<Space>"
nmap <Leader>ss :split<Return><C-w>
nmap <Leader>sv :vsplit<Return>
nmap <Leader>sh <C-w>h
nmap <Leader>sj <C-w>j
nmap <Leader>sk <C-w>k
nmap <Leader>sl <C-w>l

nmap <Leader>f :NERDTreeToggle<CR>
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
set noswapfile
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

nnoremap <Leader>d :LspDefinition<CR>
nnoremap <Leader>r :LspReferences<CR>
nnoremap <Leader>i :LspImplementation<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

set completeopt+=preview
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'thosakwe/vim-flutter'
let dart_format_on_save = 1
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'stephpy/vim-yaml'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-goimports'
Plug 'vim-ruby/vim-ruby'
Plug 'fishbullet/deoplete-ruby'
Plug 'thoughtbot/vim-rspec'
augroup rb_augroup
  autocmd!
  autocmd FileType ruby nmap <Leader>t :call RunAllSpecs()<CR>
  autocmd FileType ruby nmap <Leader>tt :call RunCurrentSpecFile()<CR>
  autocmd FileType ruby nmap <Leader>tl :call RunLastSpec()<CR>
  autocmd FileType ruby nmap <Leader>tn :call RunNearestSpec()<CR>
augroup END

Plug 'tpope/vim-rails'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'
Plug 'cohama/lexima.vim'
call plug#end()
augroup fzf_augroup
  autocmd!
  noremap e :Files<CR>
  noremap <leader>e :GFiles -c -o --exclude-standard<CR>
augroup END
augroup md_augroup
  autocmd!
  " Disable folding.
  autocmd FileType markdown set nofoldenable
  autocmd FileType markdown noremap <leader>t :Toc<CR>
augroup END
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1
augroup python_augroup
  autocmd!
  " Use tab
  autocmd FileType python nmap <leader>n  :cnext<CR>
  autocmd FileType python nmap <leader>p  :cprevious<CR>
  autocmd FileType python nmap <leader>j  <C-]>
augroup END
