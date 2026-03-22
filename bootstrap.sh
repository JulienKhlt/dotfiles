#!/usr/bin/env bash
# Bootstrap dotfiles on a machine without sudo.
# Uses nix-portable to avoid needing root for /nix.
#
# Usage:
#   git clone https://github.com/JulienKhlt/dotfiles.git ~/dotfiles
#   cd ~/dotfiles && bash bootstrap.sh

set -euo pipefail

ARCH=$(uname -m)
NIX_PORTABLE="$HOME/nix-portable"
NIX_CONF_DIR="$HOME/.config/nix"
PROFILE="${1:-julien.khlaut}"

echo "==> Bootstrapping dotfiles (profile: $PROFILE)"

# ── 1. Install nix-portable if not present ─────────────────────────────
if [ ! -x "$NIX_PORTABLE" ]; then
  echo "==> Downloading nix-portable for $ARCH..."
  curl -L "https://github.com/DavHau/nix-portable/releases/latest/download/nix-portable-${ARCH}" \
    -o "$NIX_PORTABLE"
  chmod +x "$NIX_PORTABLE"
  echo "==> nix-portable installed at $NIX_PORTABLE"
else
  echo "==> nix-portable already installed"
fi

# ── 2. Enable flakes ───────────────────────────────────────────────────
mkdir -p "$NIX_CONF_DIR"
if ! grep -q "experimental-features" "$NIX_CONF_DIR/nix.conf" 2>/dev/null; then
  echo "experimental-features = nix-command flakes" >> "$NIX_CONF_DIR/nix.conf"
  echo "==> Flakes enabled in $NIX_CONF_DIR/nix.conf"
fi

# ── 3. Apply home-manager configuration ────────────────────────────────
echo "==> Running home-manager switch (this may take a while on first run)..."
"$NIX_PORTABLE" nix run home-manager -- switch --flake ".#${PROFILE}"

echo ""
echo "==> Done! Log out and back in (or run 'source ~/.bashrc') to pick up changes."
