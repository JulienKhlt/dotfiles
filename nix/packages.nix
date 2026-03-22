{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core CLI tools
    bat
    fd
    ripgrep
    jq
    fzf
    zoxide
    tldr

    # Development
    neovim
    nodejs_20
    uv
    python3
    gcc

    # Git ecosystem
    delta
    gh
    lazygit
    git-lfs

    # Shell
    nushell
    starship
    atuin

    # TUI tools
    television
    htop

    # Fonts (for terminal/editor icons)
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];
}
