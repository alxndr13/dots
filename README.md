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


## Disable font smoothing in alacritty

```bash
defaults write org.alacritty AppleFontSmoothing -int 0
```
