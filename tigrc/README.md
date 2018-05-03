# .tigrc

<!-- vim-markdown-toc GFM -->

* [What's this?](#whats-this)
* [Configuration](#configuration)
  * [Rebase](#rebase)

<!-- vim-markdown-toc -->

## What's this?

This file is the source of my .tigrc.

[tig](https://github.com/jonas/tig) is a interactive cli-base interface of git.

## Configuration

### Rebase

Start `git rebase` by typing `R` in tig's log view.
Very easy to specify the starting commit to rebase.

```tig
bind main R !git rebase -i %(commit)
```

