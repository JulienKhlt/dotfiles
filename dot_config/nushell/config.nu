# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
alias nvim = ~/nvim.appimage
$env.config.show_banner = false


$env.PATH = [/home/julien.khlaut/] ++ $env.PATH ++ ["/usr/local/cuda/bin", "~/.atuin/bin"]
$env.LD_LIBRARY_PATH = "/usr/local/cuda/lib64/"
$env.EDITOR = "nvim"

source ~/.config/nushell/poetry.nu
source ~/.config/nushell/uv.nu
$env.config.edit_mode = 'vi'
$env.config.buffer_editor = "/home/julien.khlaut/nvim.appimage"
gh config set editor "/home/julien.khlaut/nvim.appimage"

source ~/.local/share/atuin/init.nu

use ~/.config/nushell/scripts/rarm-eval.nu *
