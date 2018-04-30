# .zshrc.local

## What's this?

This file is the source of my `.zshrc.local` file.
Add `source ${HOME}/.zshrc.local` in your `.zshrc` to activate it.

## pyenv

```zsh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

## rbenv

```zsh
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
```

## nodenv

```zsh
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval "$(nodenv init -)"
```

## Golang

```zsh
export PATH=$PATH:/usr/local/go/bin:$HOME/r/bin
export GOPATH=$HOME/r
```

## Misc

Deactivate screen lock (C-s)
```zsh
stty ixany
```
