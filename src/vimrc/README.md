# .vimrc

<!-- vim-markdown-toc GFM -->

* [What's this?](#whats-this)
* [Prerequisite](#prerequisite)
  * [Vim 8](#vim-8)
  * [vim-plug](#vim-plug)
  * [Python 3.5 and neovim](#python-35-and-neovim)
  * [fzf](#fzf)
* [General](#general)
  * [Assign `Space` key to the `leader` key.](#assign-space-key-to-the-leader-key)
  * [Split window with Space ss and Space sv](#split-window-with-space-ss-and-space-sv)
  * [Travel windows with Space s{hjkl}](#travel-windows-with-space-shjkl)
  * [Toggle NERDTree with `<Space>f`.](#toggle-nerdtree-with-spacef)
* [Plugins](#plugins)
  * [LSP](#lsp)
  * [Auto completion](#auto-completion)
  * [Auto formatter](#auto-formatter)
  * [Dart](#dart)
    * [Enable DartFmt execution on buffer save.](#enable-dartfmt-execution-on-buffer-save)
  * [Markdown](#markdown)
  * [YAML](#yaml)
  * [NERDTree](#nerdtree)
  * [fzf](#fzf-1)
  * [Golang](#golang)
  * [Typescript](#typescript)
  * [Ruby](#ruby)
  * [Python](#python)
  * [Lexima](#lexima)
  * [Initialize vim-plug](#initialize-vim-plug)
* [Look and feel](#look-and-feel)
  * [Fzf](#fzf-2)
  * [Markdown](#markdown-1)
  * [Golang](#golang-1)
  * [Python](#python-1)
* [Tips](#tips)
  * [Keybindings](#keybindings)
  * [How to check the filetype of the opened file.](#how-to-check-the-filetype-of-the-opened-file)

<!-- vim-markdown-toc -->

## What's this?

This file is the source of my .vimrc file.

## Prerequisite

### Vim 8

I recently started to use Vim 8 and found it super!!
Here's the script to install it in Ubuntu 16.04

```sh
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim
```

The script above is copied from 
http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/

### vim-plug
This .vimrc uses [vim-plug](https://github.com/junegunn/vim-plug) to install vim plugins so that I need to run the following command in advance.

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Python 3.5 and neovim

`neovim`, whichi is the Python module of vim client, is required by `deoplete` plugin.

Python 3.5 is registerted in apt packages.

```sh
sudo apt-get install python3 python3-pip
```

`neovim` is installable by `pip` or `pip3` command.

```sh
sudo pip3 install neovim
```

I tried to use Python installed by `pyenv` at first but gave up after several minutes struggling.
I uses the default system Python now.

### fzf

[`fzf`](https://github.com/junegunn/fzf) is a command-line fuzzy finder which is available from vim with its vim plugin.

`fzf` is easy to install with `go get` command (as far as you've installed `go`)

```sh
go get github.com/junegunn/fzf
```


## General

Use spaces instead of tab.

```vim
set expandtab
```

Show 2 spaces for each tab.
This conf is useful especially when I write Golang.

```vim
set tabstop=2
```

Use 2 spaces for each indent.

```vim
set shiftwidth=2
```

Show line numbers.

```vim
set number
```

Save files automatically.

```vim
set autowrite
```

In `Tab` typed, show the list of matches and complete the longest common part.
In `Tab` tabyped again, select the first match, the second match etc. 

```vim
set wildmenu
set wildmode=list:longest,full
```

### Assign `Space` key to the `leader` key.

```vim
let mapleader = "\<Space>"
```

### Split window with Space ss and Space sv

```vim
nmap <Leader>ss :split<Return><C-w>
nmap <Leader>sv :vsplit<Return>
```

### Travel windows with Space s{hjkl}

```vim
nmap <Leader>sh <C-w>h
nmap <Leader>sj <C-w>j
nmap <Leader>sk <C-w>k
nmap <Leader>sl <C-w>l

```

### Toggle NERDTree with `<Space>f`.

```vim
nmap <Leader>f :NERDTreeToggle<CR>
```

Highlight matched texts.
```vim
set hlsearch
```

Activate incremental search.
```vim
set incsearch
```

Ignore the difference of cases until I use both lower/upper case characters in search.
```vim
set ignorecase
set smartcase
```

Switch buffers with `<TAB>`

```vim
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
```

Disable swp file

```vim
set noswapfile
```
## Plugins

Let vim-plug install the plugins in `~/.vim/plugged`.


```vim
call plug#begin('~/.vim/plugged')
```

### LSP

```vim
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
```

### Auto completion

```vim
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

set completeopt+=preview
```

### Auto formatter

```vim
Plug 'chiel92/vim-autoformat'
```
### Dart
https://github.com/thosakwe/vim-flutter

```vim
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'thosakwe/vim-flutter'
```

#### Enable DartFmt execution on buffer save.

```vim
let dart_format_on_save = 1
```

### Markdown

Plugins to edit Markdown.
https://github.com/plasticboy/vim-markdown

```vim
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
```

Plugin to generate TOC of a markdown file.
https://github.com/mzlogin/vim-markdown-toc

```vim
Plug 'mzlogin/vim-markdown-toc'
```


### YAML
Plugin to edit YAML files.

```vim
Plug 'stephpy/vim-yaml'
```

### NERDTree

https://github.com/scrooloose/nerdtree

```vim
Plug 'scrooloose/nerdtree'
```

### fzf

- https://github.com/junegunn/fzf/blob/master/README-VIM.md
- https://github.com/junegunn/fzf.vim

```vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
```


### Golang

```vim
Plug 'mattn/vim-goimports'
```

### Typescript
https://github.com/pangloss/vim-javascript
https://github.com/leafgarland/typescript-vim

```vim
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ryanolsonx/vim-lsp-typescript'
```

### Ruby

Plugins to edit Ruby.

`vim-ruby`'s document is here. https://github.com/vim-ruby/vim-ruby/wiki 

```vim
Plug 'vim-ruby/vim-ruby'
```

deoplete's plugin for Ruby.
https://github.com/fishbullet/deoplete-ruby

```vim
Plug 'fishbullet/deoplete-ruby'
```

Plugin to run rspec via vim.
https://github.com/thoughtbot/vim-rspec

```vim
Plug 'thoughtbot/vim-rspec'
```

```vim
augroup rb_augroup
  autocmd!
  autocmd FileType ruby nmap <Leader>t :call RunAllSpecs()<CR>
  autocmd FileType ruby nmap <Leader>tt :call RunCurrentSpecFile()<CR>
  autocmd FileType ruby nmap <Leader>tl :call RunLastSpec()<CR>
  autocmd FileType ruby nmap <Leader>tn :call RunNearestSpec()<CR>
augroup END

```

Plugin for Rails projects.

```vim
Plug 'tpope/vim-rails'
```

### Python
https://github.com/zchee/deoplete-jedi
https://github.com/davidhalter/jedi

```vim
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'
```
### Lexima

Auto close parentheses and repeat by dot dot dot...
https://github.com/cohama/lexima.vim

```vim
Plug 'cohama/lexima.vim'
```

### Initialize vim-plug

Let vim-plug initialzie itself with the plugins above.

```vim
call plug#end()
```

Now that I can install/update the plugins with `:PluginInstall` command.


## Look and feel

### Fzf

Run `Files` with `e`.

```vim
augroup fzf_augroup
  autocmd!
  noremap e :Files<CR>
  noremap <leader>e :GFiles -c -o --exclude-standard<CR>
augroup END
```

### Markdown

```vim
augroup md_augroup
  autocmd!
  " Disable folding.
  autocmd FileType markdown set nofoldenable
  autocmd FileType markdown noremap <leader>t :Toc<CR>
augroup END
```

Enable TOC window auto-fit.

```vim
let g:vim_markdown_toc_autofit = 1
```

Follow named anchors.

```vim
let g:vim_markdown_follow_anchor = 1
```

### Golang

### Python
```vim
augroup python_augroup
  autocmd!
  " Use tab
  autocmd FileType python nmap <leader>n  :cnext<CR>
  autocmd FileType python nmap <leader>p  :cprevious<CR>
  autocmd FileType python nmap <leader>j  <C-]>
augroup END
```

## Tips
Links in this section might include pages in Japanese.

### Keybindings
- http://vim-jp.org/vimdoc-ja/map.html
- https://cocopon.me/blog/2013/10/vim-map-noremap/

### How to check the filetype of the opened file.
```
verbose set filetype?
```

