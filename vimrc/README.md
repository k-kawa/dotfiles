# .vimrc

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

## Configurations


### Install plugins

Let vim-plug install the plugins in `~/.vim/plugged`.


```vim
call plug#begin('~/.vim/plugged')
```

#### Markdown

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

#### YAML
Plugin to edit YAML files.

```vim
Plug 'stephpy/vim-yaml'
```

#### Auto complete (Deoplete)
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

#### Golang

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











#### Initialize vim-plug

Let vim-plug initialzie itself with the plugins above.

```vim
call plug#end()
```

Now that I can install/update the plugins with `:PluginInstall` command.


### Variables

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

Disable folding.

```vim
set nofoldenable
```

### Keymaps

#### leader

Assign `Space` key to the `mapleader` key.

```vim
let mapleader = "\<Space>"
```


#### Common



#### Golang

```vim
augroup go_augroup
  autocmd!
  autocmd FileType go set noexpandtab
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>n  :cnext<CR>
  autocmd FileType go nmap <leader>p  :cprevious<CR>
augroup END
```




