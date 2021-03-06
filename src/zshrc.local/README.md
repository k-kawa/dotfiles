# .zshrc.local

<!-- vim-markdown-toc GFM -->

* [What's this?](#whats-this)
* [Configurations](#configurations)
  * [pyenv](#pyenv)
  * [rbenv](#rbenv)
  * [nodenv](#nodenv)
  * [Golang](#golang)
  * [Rust](#rust)
  * [Flutter](#flutter)
  * [Git](#git)
  * [peco + ghq](#peco--ghq)
  * [peco/fzf](#pecofzf)
  * [Vim](#vim)
  * [Bookmark](#bookmark)
  * [Git](#git-1)
  * [MySQL Client](#mysql-client)
  * [FZF](#fzf)
  * [ghq](#ghq)
  * [Misc executables](#misc-executables)
  * [Misc](#misc)

<!-- vim-markdown-toc -->

## What's this?

This file is the source of my `.zshrc.local` file.
Add `source ${HOME}/.zshrc.local` in your `.zshrc` to activate it.

## Configurations

### pyenv

Use `pytyon` installed by brew instead of the default one.
https://stackoverflow.com/questions/49704364/make-python3-as-my-default-python-on-mac

```zsh
export PATH=/usr/local/opt/python/libexec/bin:$PATH
```

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
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GO111MODULE=on
```

### Rust 

```zsh
export PATH=$PATH:$HOME/.cargo/bin
```

### Flutter

Add `$HOME/.dev_tools/flutter/.bin` directory to PATH.

```zsh
export FLUTTER_HOME="${HOME}/.dev_tools/flutter"
export PATH="${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/.pub-cache/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin"
```

### Git

`gls` to list all the files in the working diretory respecting `.gitignore`.
[Man of `git ls-files`](https://git-scm.com/docs/git-ls-files)

```zsh
alias gls='git ls-files -c -o --exclude-standard'
```

### peco + ghq

`g` to change directories to one of the cloned git repositories maintained by `peco`

```zsh
alias g='cd $(ghq root)/$(ghq list | peco)'
```

### peco/fzf

`q_or_2` is the function such that ...
- when the first line of the given text from stdin ends with `!`, it returns the line without the following last `!` 
- otherwise it returns the second line.

This function is useful when it is piped after `peco/fzf --print-query` command.

```zsh
function q_or_2() {          
  local o
  local f
  o=$(cat -)

  # Extract str leading of ?
  f=$(echo $o | head -n 1 | sed -n -E 's/^([^?]*)!\s*/\1/gp')
  if [ "$f" != "" ]; then
    echo $f 
  else
    echo $o | sed -n '2p'
  fi
}

alias pecoq='peco --print-query | q_or_2'
alias fzfq='fzf --print-query | q_or_2'
```

### Vim
```zsh
alias v='vim $(ls | fzfq)'
alias vdotfiles='pushd ~/dotfiles > /dev/null && vim $(gls | fzfq) && popd > /dev/null'
alias vl='pushd ~/til > /dev/null && vim $(gls | fzfq) && git add . && git commit -m "update" && (git push origin master) & ; popd > /dev/null'
```

### Bookmark

`bm` to bookmark the current working directory.

```zsh
alias bm='echo "${PWD}" >> ~/.bookmarks'
```

`cdb` to list bookmarks and move to one of them.

```zsh
alias cdb='cd $(cat ~/.bookmarks | sort | uniq | sed -e "/^#/d" | sed -e "/^\s*$/d" | fzfq)'
```

`vbm` to start vim to edit the bookmarks.

```zsh
alias vbm='vim ~/.bookmarks'
```

### Git

`cdg` to move repositories managed in GOPATH.
```zsh
alias cdg='cd "${GOPATH}/src"/$(find ${GOPATH}/src -maxdepth 3 -mindepth 3 -type d | sed -re "s/^.*?\/(.*\/.*\/.*)$/\1/g" | fzfq)'
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

### MySQL Client
```zsh
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
```


### FZF

Load fzf key-bindings file when it's ready.

```zsh
if [ -e "${GOPATH}/src/github.com/junegunn/fzf/shell/key-bindings.zsh" ]; then
  source "${GOPATH}/src/github.com/junegunn/fzf/shell/key-bindings.zsh"
fi
```

### ghq
https://github.com/motemen/ghq

```zsh
export GHQ_ROOT=$GOPATH/src
```

### Misc executables

```zsh
export PATH=$PATH:$HOME/.local/bin
```

### Misc

Deactivate screen lock (C-s)
```zsh
stty ixany
```

Change key bindings with `xmodmap`

```zsh
if which xmodmap > /dev/null; then
  xmodmap ~/.Xmodmap
fi
```

