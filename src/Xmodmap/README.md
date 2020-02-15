# .Xmodmap

## What's this?

## Configuration

Regard `Henkan` as `Escape`

```xmodmap
keycode 100 = Escape
```

Regard `Muhenkan` and `Kana` keys as `Space`

```xmodmap
keycode 101 = space
keycode 102 = space
```

## How to check the keycode.

Use `xev` command.

`xev` command opens a small window which captures and dumps all the occurred events including `KeyPress` events each of which has keycode property.

You can see logs like below when you type `Space` key.

    KeyPress event, serial 37, synthetic NO, window 0x3c00001,
      ...
      state 0x0, keycode 65 (keysym 0x20, space), same_screen YES,
      ...


The log says that the keycode of `Space` key is 65.

## How to check the current keycode mapping

```sh
xmodmap -pke
```

# Tips
- http://bearmini.hatenablog.com/entry/2013/07/12/161637
-
