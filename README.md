# Dotfiles

Managed with [Nix](https://nixos.org/) + [home-manager](https://github.com/nix-community/home-manager) (no sudo required).

## Quick Start (no sudo required)

```bash
git clone https://github.com/JulienKhlt/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash bootstrap.sh
```

The bootstrap script will:
1. Download [nix-portable](https://github.com/DavHau/nix-portable) (no root needed)
2. Enable Nix flakes
3. Run `home-manager switch` to apply the configuration

### Subsequent updates

```bash
cd ~/dotfiles && git pull
~/nix-portable nix shell nixpkgs#nix home-manager -c home-manager switch --flake .#julien.khlaut
```

### If you have sudo / regular Nix

```bash
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
. ~/.nix-profile/etc/profile.d/nix.sh
git clone https://github.com/JulienKhlt/dotfiles.git ~/dotfiles
cd ~/dotfiles
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
nix run home-manager -- switch --flake .#julien.khlaut
```

## Profiles

| Profile | System | Usage |
|---------|--------|-------|
| `julien.khlaut` | Linux x86_64 | Default Linux workstation / HPC cluster |
| `julien-macos` | macOS aarch64 | MacBook with AeroSpace, Sketchybar, Karabiner |

To add a new profile, edit `flake.nix` and add a new `homeConfigurations` entry.

## Structure

```
flake.nix              # Nix flake entry point
nix/
  home.nix             # Main home-manager config
  packages.nix         # All Nix packages
  shell.nix            # Bash, Zsh, Nushell, Starship, FZF, Zoxide, Atuin
  git.nix              # Git + delta + aliases
  tmux.nix             # Tmux + plugins
  editor.nix           # Neovim (LazyVim config files)
  tools.nix            # Ghostty, Lazygit, gh-dash, Television
  macos.nix            # macOS-only: AeroSpace, Karabiner, Sketchybar
dot_config/            # Raw config files referenced by Nix modules
```

## Legacy

The previous chezmoi + install.sh setup has been replaced by Nix.
The `dot_config/install.sh` is kept for reference but is no longer needed.
