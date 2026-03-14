# Dotfiles from ahuck

managed using [chezmoi](https://www.chezmoi.io/)

## how to setup on a new machine

- create a chezmoi config with my age key (which needs to be created as well)

```bash
vi ~/.config/chezmoi/chezmoi.toml
```

```bash
encryption = "age"
[age]
    identity = "/home/user/key.txt"
    recipient = "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p"

```

- get those dotfiles and set them up

```bash
chezmoi init --apply --verbose ssh://git@gitlab.inovex.de:2424/ahuck/dots.git
```

## MacOS Dock settings

```
defaults write com.apple.dock autohide-delay -float 0; killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0.1; killall Dock
```

## MacOS TouchID for sudo

```
https://sixcolors.com/post/2023/08/in-macos-sonoma-touch-id-for-sudo-can-survive-updates/
```

## zsh case-insensitive tab completion

Add to `~/.zshrc` (after `compinit`):

```bash
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
```

Exact matches are preferred first, then case-insensitive, then partial-word, then substring.

## Disable font smoothing in alacritty

```bash
defaults write org.alacritty AppleFontSmoothing -int 0
```
