# Marcel's dotfiles

## Symlinks
### Neovim
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```
### Starship
```bash
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```
### Ghostty
```bash
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```
### Nix
```bash
ln -s ~/dotfiles/nix ~/.config/nix
```
### Spotify Player
```bash
ln -s ~/dotfiles/spotify-player/app.toml ~/.config/spotify-player/app.toml
```
## Install nix packages
```bash
nix develop ~/dotfiles
```

