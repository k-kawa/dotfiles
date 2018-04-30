# .tmux.conf

## Configurations

Cancel keybindings for C-b, the default.

```tmux
unbind C-b
```

Use `C-q` as the prefix key.

```tmux
set -g prefix C-q
```

Use mouse

```tmux
set -g mouse on
set -g mouse-utf8 on
```

Open a window/pane with `F-2`

- `F-2`: open a new window.
- `S-F2`: split the current window horizontally and open a new pane.
- `C-F2`: split the current window vertically and open a new pane.

```tmux
bind-key -n F2 new-window -c "#{pane_current_path}" \; rename-window "-"

bind-key -n C-F2 display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n S-F2 display-panes \; split-window -v -c "#{pane_current_path}"
```

Switch windows with `F3` and `F4`

```tmux
bind-key -n F3 previous-window
bind-key -n F4 next-window
```

Switch panes with `M-arrow`

```tmux
bind-key -n M-Up display-panes \; select-pane -U
bind-key -n M-Down display-panes \; select-pane -D
bind-key -n M-Left display-panes \; select-pane -L
bind-key -n M-Right display-panes \; select-pane -R
```

Resize panes with `M-S-arrow`

```tmux
bind-key -n M-S-Up resize-pane -U
bind-key -n M-S-Down resize-pane -D
bind-key -n M-S-Left resize-pane -L
bind-key -n M-S-Right resize-pane -R
```

Start `copy-mode` with `F7`

```tmux
bind-key -n F7 copy-mode
```

