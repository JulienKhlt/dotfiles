# Dotfiles

Managed with [Nix](https://nixos.org/) + [home-manager](https://github.com/nix-community/home-manager) (no sudo required).

## Quick Start

### 1. Install Nix (single-user, no sudo)

```bash
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
. ~/.nix-profile/etc/profile.d/nix.sh
```

### 2. Clone and apply

```bash
git clone https://github.com/JulienKhlt/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Enable flakes (one-time)
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# Apply the configuration (adjust the profile name to match your username)
nix run home-manager -- switch --flake .#julien.khlaut
```

### 3. Subsequent updates

```bash
cd ~/dotfiles
home-manager switch --flake .#julien.khlaut
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
