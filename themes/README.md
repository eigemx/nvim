# themes

Central source of truth for system themes, organized by application. Live
files live elsewhere; this directory is used for reinstall / rollback.

| File | Live location |
|---|---|
| `ptyxis/cyberdream-muted.palette` | `~/.local/share/org.gnome.Ptyxis/palettes/` |
| `opencode/cyberdream-muted.json` | `~/.config/opencode/themes/cyberdream-muted.json` |
| `tmux/cyberdream-muted.conf` | `~/.config/nvim/tmux/theme.conf` (active), plus `~/.config/nvim/tmux/cyberdream-muted.conf` |
| `tmux/rose-pine.conf` | rollback copy of previous tmux theme |

Palette (muted): bg `#16181a`, surface `#1e2124`, overlay `#3c4048`,
fg `#ffffff`, grey `#7b8496`, blue `#78a8e8`, green `#7ee088`,
cyan `#7ed8e8`, red `#e8796f`, yellow `#e3c875`, magenta `#e878d8`,
orange `#e3a875`, purple `#b07ee8`.

## Reinstall from here

```sh
cp themes/ptyxis/cyberdream-muted.palette ~/.local/share/org.gnome.Ptyxis/palettes/
cp themes/opencode/cyberdream-muted.json ~/.config/opencode/themes/cyberdream-muted.json
cp themes/tmux/cyberdream-muted.conf ~/.config/nvim/tmux/theme.conf
tmux source-file ~/.config/nvim/.tmux.conf
# opencode: /theme -> cyberdream-muted
# ptyxis: Preferences -> Appearance -> Cyberdream-muted
```

## Roll back to rose-pine

- tmux: `cp themes/tmux/rose-pine.conf ~/.config/nvim/tmux/theme.conf && tmux source-file ~/.config/nvim/.tmux.conf`
- opencode: `/theme` -> `system` (or default `opencode`)
- ptyxis: Preferences -> Appearance -> previous palette
- nvim: untouched, still `cyberdream-muted` (`lua/colorscheme.lua`)
