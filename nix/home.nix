{ config, pkgs, lib, username, homeDirectory, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./editor.nix
    ./tools.nix
    ./packages.nix
  ];

  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      PYTHONBREAKPOINT = "ipdb.set_trace";
      HYDRA_FULL_ERROR = "1";
      NCCL_P2P_DISABLE = "1";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/bin"
      "/usr/local/bin"
    ];
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # XDG base directories
  xdg.enable = true;
}
