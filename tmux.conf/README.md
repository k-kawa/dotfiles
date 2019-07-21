# .tmux.conf

<!-- vim-markdown-toc GFM -->

* [Swich prefix key](#swich-prefix-key)
* [Move panes in vim-like way](#move-panes-in-vim-like-way)
* [vim-like copy mode](#vim-like-copy-mode)
* [Resize panes in vim-like way](#resize-panes-in-vim-like-way)
* [Start `copy-mode` with `F7`](#start-copy-mode-with-f7)
* [Mouse](#mouse)

<!-- vim-markdown-toc -->

## Swich prefix key

Cancel keybindings for `C-b`, the default.

```tmux
unbind C-b
```

Use `C-q` as the prefix key.

```tmux
set -g prefix C-q
```

## Move panes in vim-like way

```tmux
bind-key -r k select-pane -U
bind-key -r j select-pane -D
bind-key -r h select-pane -L
bind-key -r l select-pane -R
```

## vim-like copy mode

```tmux
setw -g mode-keys vi
```

## Resize panes in vim-like way

```tmux
bind-key -r K resize-pane -U 1
bind-key -r J resize-pane -D 1
bind-key -r H resize-pane -L 1
bind-key -r L resize-pane -R 1
```

## Start `copy-mode` with `F7`

```tmux
bind-key -n F7 copy-mode
```

## Mouse

```tmux
set -g mouse on
```
