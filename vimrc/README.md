# .vimrc

<!-- vim-markdown-toc GFM -->

* [What's this?](#whats-this)
* [Prerequisite](#prerequisite)
  * [Vim 8](#vim-8)
  * [vim-plug](#vim-plug)
  * [Python 3.5 and neovim](#python-35-and-neovim)
* [Plugins](#plugins)
  * [Markdown](#markdown)
    * [Config](#config)
  * [YAML](#yaml)
  * [NERDTree](#nerdtree)
  * [Auto complete (Deoplete)](#auto-complete-deoplete)
  * [Golang](#golang)
  * [Ruby](#ruby)
  * [Initialize vim-plug](#initialize-vim-plug)
* [Look and feel](#look-and-feel)
  * [General](#general)
  * [Markdown](#markdown-1)
  * [Golang](#golang-1)

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

## Plugins

Let vim-plug install the plugins in `~/.vim/plugged`.


```vim
call plug#begin('~/.vim/plugged')
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

#### Config

Enable TOC window auto-fit.

```vim
let g:vim_markdown_toc_autofit = 1
```

Follow named anchors.

```vim
let g:vim_markdown_follow_anchor = 1
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

### Auto complete (Deoplete)
I love Deoplete!!

```vim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
```

### Golang

Plugins to edit golang.

`vim-go` integrates vim with Golang toolkits such as gofmt, errcheck etc.

```vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
```

`vim-go`'s tutorial in Japanese is here. https://github.com/hnakamur/vim-go-tutorial-ja

deoplete's plugin for Golang.
https://github.com/zchee/deoplete-go

```vim
Plug 'zchee/deoplete-go', { 'do': 'make'}
```

### Ruby

Plugins to edit ruby.

`vim-ruby`'s document is here. https://github.com/vim-ruby/vim-ruby/wiki 

```vim
Plug 'vim-ruby/vim-ruby'
```

deoplete's plugin for Ruby.
https://github.com/fishbullet/deoplete-ruby

```vim
Plug 'fishbullet/deoplete-ruby'
```


### Initialize vim-plug

Let vim-plug initialzie itself with the plugins above.

```vim
call plug#end()
```

Now that I can install/update the plugins with `:PluginInstall` command.


## Look and feel

### General

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

Assign `Space` key to the `leader` key.

```vim
let mapleader = "\<Space>"
```

Toggle NERDTree with `F8`.

```vim
nmap <F8> :NERDTreeToggle<CR>
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

### Markdown


```vim
augroup md_augroup
  autocmd!
  " Disable folding.
  autocmd FileType markdown set nofoldenable
augroup END
```


### Golang

```vim
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
```




