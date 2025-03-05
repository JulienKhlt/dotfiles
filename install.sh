git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(pwd)/dotfiles/tmux .config/tmux

curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.app nvim.appimage

# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
#
rm .zshrc
ln -s ~/dotfiles/.zshrc .zshrc
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/nushell/config.nu ~/.config/nushell/config.nu

# install brew
curl -sS https://webi.sh/brew | sh
source ~/.config/envman/PATH.env

brew install lazygit
brew install nushell

pipx install poetry
