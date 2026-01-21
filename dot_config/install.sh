git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.app nvim.appimage

# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
#

curl -sS https://webi.sh/bat | sh
curl -sS https://webi.sh/delta | sh
curl -sS https://webi.sh/fd | sh
curl -sS https://webi.sh/brew | sh
curl -sS https://webi.sh/rg | sh
curl -sS https://webi.sh/jq | sh
source ~/.config/envman/PATH.env

brew install lazygit
brew install chezmoi
brew install tldr
brew install nushell
brew install gh

curl -LsSf https://astral.sh/uv/install.sh | sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

chezmoi init https://github.com/JulienKhlt/dotfiles.git
gh extension install dlvhdr/gh-dash

pipx install poetry
