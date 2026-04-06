{ config, pkgs, lib, ... }:

{
  # ── Bash (login shell — launches tmux, then nushell) ──────────────────
  programs.bash = {
    enable = true;
    enableCompletion = true;

    profileExtra = ''
      # Auto-start tmux on interactive login shell
      if [ -t 0 ]; then
        if [ -z "$TMUX" ]; then
          exec tmux new-session -A -s workspace
        fi
      fi
    '';

    initExtra = ''
      # Bash is only used as login shell to bootstrap tmux + nushell.
      # Launch nushell as the interactive shell.
      if command -v nu &>/dev/null; then
        exec nu
      fi
    '';
  };

  # ── Nushell (primary interactive shell) ───────────────────────────────
  xdg.configFile = {
    "nushell/config.nu".source = ../dot_config/nushell/config.nu;
    "nushell/env.nu".source = ../dot_config/nushell/env.nu;

    # Completion/helper scripts
    "nushell/git.nu".source = ../dot_config/nushell/git.nu;
    "nushell/poetry.nu".source = ../dot_config/nushell/poetry.nu;
    "nushell/uv.nu".source = ../dot_config/nushell/uv.nu;
    "nushell/vendor/autoload/tv.nu".source = ../dot_config/nushell/vendor/autoload/tv.nu;
  };

  # ── Starship prompt ───────────────────────────────────────────────────
  xdg.configFile."starship.toml".source = ../dot_config/starship.toml;

  # ── FZF ───────────────────────────────────────────────────────────────
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  # ── Zoxide ────────────────────────────────────────────────────────────
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  # ── Atuin (shell history) ─────────────────────────────────────────────
  programs.atuin = {
    enable = true;
    enableBashIntegration = false;
    enableNushellIntegration = false; # sourced manually in config.nu
  };
}
