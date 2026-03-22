{ config, pkgs, lib, ... }:

{
  # ── Bash ──────────────────────────────────────────────────────────────
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

      . "$HOME/.atuin/bin/env" 2>/dev/null || true
    '';

    initExtra = ''
      # Atuin shell history
      if command -v atuin &>/dev/null; then
        eval "$(atuin init bash)"
      fi

      # Launch nushell as interactive shell (optional — remove if not wanted)
      # exec nu
    '';
  };

  # ── Zsh ───────────────────────────────────────────────────────────────
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "poetry" ];
    };

    sessionVariables = {
      LC_CTYPE = "fr_FR.UTF-8";
      LC_ALL = "fr_FR.UTF-8";
      JZ_USER = "umb39ck";
      JZ_PATH_MEDSAM = "/gpfswork/rech/wzq/umb39ck/medsam";
      MLFLOW_TRACKING_URI = "http://tungsten.local:5000";
    };

    initExtraFirst = ''
      # Auto-start tmux
      if [ -z "$TMUX" ]; then
        exec tmux new-session -A -s workspace -d
      fi
    '';

    shellAliases = {
      sd = "navigate_to_project";
    };

    initExtra = ''
      # ── FZF project navigation ──
      navigate_to_project() {
        local MYPATH
        MYPATH=$(find ~/raidium/* -maxdepth 0 -type d | fzf-tmux -p)

        if [ -n "$MYPATH" ]; then
          local SESSION_NAME=$(basename "$MYPATH")

          if [ -n "$TMUX" ]; then
            if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
              (cd "$MYPATH" && tmux new-session -d -s "$SESSION_NAME")
            fi
            tmux switch-client -t "$SESSION_NAME"
          else
            (cd "$MYPATH" && tmux attach -t "$SESSION_NAME" || tmux new -s "$SESSION_NAME")
          fi
        fi
      }
      zle -N navigate_to_project
      bindkey '^T' navigate_to_project

      # ── Tmux environment sync ──
      update_environment_from_tmux() {
        if [ -n "''${TMUX}" ]; then
          eval "$(tmux show-environment -s)"
        fi
      }
      add-zsh-hook precmd update_environment_from_tmux

      # ── Zoxide ──
      eval "$(zoxide init --cmd cd zsh)"

      # ── Atuin ──
      if command -v atuin &>/dev/null; then
        eval "$(atuin init zsh)"
      fi

      # ── Starship ──
      eval "$(starship init zsh)"
    '';
  };

  # ── Nushell ───────────────────────────────────────────────────────────
  # Nushell config files are placed via xdg.configFile since
  # the home-manager module doesn't cover all nushell config patterns
  xdg.configFile = {
    "nushell/config.nu".source = ../dot_config/nushell/config.nu;
    "nushell/env.nu".source = ../dot_config/nushell/env.nu;

    # Keep the nushell completion/helper scripts
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
    enableZshIntegration = false; # we handle Ctrl-T ourselves
    enableBashIntegration = true;
  };

  # ── Zoxide ────────────────────────────────────────────────────────────
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    # zsh/bash integration done manually above for --cmd cd
  };

  # ── Atuin (shell history) ─────────────────────────────────────────────
  programs.atuin = {
    enable = true;
    enableZshIntegration = false; # done manually for ordering
    enableBashIntegration = false;
    enableNushellIntegration = false;
  };
}
