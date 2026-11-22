# dotfiles

Personal Hyprland setup for CachyOS / Arch, themed with **Catppuccin Mocha**
and managed with [GNU Stow](https://www.gnu.org/software/stow/).

Built for Hyprland 0.57+, which uses a Lua config (`hyprland.lua`)
instead of the old `hyprland.conf`.

## What's inside

| Package     | What it does                                                          |
|-------------|-----------------------------------------------------------------------|
| `hypr`      | Hyprland Lua config, autostart for wallpaper and bar, launcher script |
| `waybar`    | Top bar split into three floating islands                             |
| `kitty`     | Terminal: JetBrainsMono Nerd Font, 0.85 opacity, blur                 |
| `starship`  | Minimal one-line prompt in Catppuccin colors                          |
| `fastfetch` | System info shown when opening a terminal                             |
| `bash`      | `.bashrc` with ble.sh and starship                                    |

## Requirements

hyprland, waybar, awww, kitty, starship, fastfetch, stow, ble.sh
and the JetBrainsMono Nerd Font.

## Install

Back up your current config first, then:

    git clone https://github.com/AlejandroLopezData/dotfiles ~/dotfiles
    cd ~/dotfiles
    stow hypr waybar rofi kitty starship fastfetch bash wallpapers

Stow refuses to overwrite existing files. If it reports a conflict,
move the old file away and run it again.

## Notes

- **Personal shell config:** `.bashrc` loads `~/.bashrc.local` if it exists.
  Put machine-specific things there; it is not tracked by git.
- **Launcher script:** `hypr/.config/hypr/setup-launcher.sh` hides most desktop
  entries from the app launcher and creates Netflix and Chess.com web-app entries.
  Read it before running it and edit the list to your own apps.
- **Wallpaper:** `fondo2.jpg` is the default wallpaper. The `wallpapers` package
  puts it in `~/Pictures/wallpapers/` and `hyprland.lua` sets it on startup with awww.
  To use your own, drop an image in that folder and edit the path in `hyprland.lua`.
