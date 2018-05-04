# .zshrc.local

<!-- vim-markdown-toc GFM -->

* [What's this?](#whats-this)
* [Configurations](#configurations)
  * [pyenv](#pyenv)
  * [rbenv](#rbenv)
  * [nodenv](#nodenv)
  * [Golang](#golang)
  * [Vim](#vim)
  * [Bookmark](#bookmark)
  * [Git](#git)
  * [FZF](#fzf)
  * [Misc](#misc)

<!-- vim-markdown-toc -->

## What's this?

This file is the source of my `.zshrc.local` file.
Add `source ${HOME}/.zshrc.local` in your `.zshrc` to activate it.


## Configurations
### pyenv

```zsh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

### rbenv

```zsh
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
```

### nodenv

```zsh
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval "$(nodenv init -)"
```

### Golang

```zsh
export PATH=$PATH:/usr/local/go/bin:$HOME/r/bin
export GOPATH=$HOME/r
```

### Vim
```zsh
alias v='vim $(fzf)'
alias vdotfiles='pushd ~/dotfiles > /dev/null; vim README.md; popd > /dev/null'
alias vtil='pushd ~/til > /dev/null; vim README.md; popd > /dev/null'
```

### Bookmark

`bm` to bookmark the current working directory.

```zsh
alias bm='echo "${PWD}" >> ~/.bookmarks'
```

`cdb` to list bookmarks and move to one of them.

```zsh
alias cdb='cd $(cat ~/.bookmarks | sort | uniq | sed -e "/^#/d" | sed -e "/^\s*$/d" | fzf)'
```

`vbm` to start vim to edit the bookmarks.

```zsh
alias vbm='vim ~/.bookmarks'
```

### Git

`cdg` to move repositories managed in GOPATH.
```zsh
alias cdg='cd "${GOPATH}/src"/$(find ${GOPATH}/src -maxdepth 3 -mindepth 3 -type d | sed -re "s/^.*?\/(.*\/.*\/.*)$/\1/g" | fzf)'
```

`fbr` to list and switch branches.

```zsh
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
```

### FZF

Load fzf key-bindings file when it's ready.

```zsh
if [ -e "${GOPATH}/src/github.com/junegunn/fzf/shell/key-bindings.zsh" ]; then
  source "${GOPATH}/src/github.com/junegunn/fzf/shell/key-bindings.zsh"
fi
```

### Misc

Deactivate screen lock (C-s)
```zsh
stty ixany
```

Change key bindings with `xmodmap`

```zsh
xmodmap ~/.Xmodmap
```
