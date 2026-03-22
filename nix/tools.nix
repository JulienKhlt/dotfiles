{ config, ... }:

{
  # ── Ghostty terminal ──────────────────────────────────────────────────
  xdg.configFile."ghostty/config".source = ../dot_config/ghostty/config;

  # ── Lazygit ───────────────────────────────────────────────────────────
  xdg.configFile."lazygit/config.yml".source = ../dot_config/lazygit/config.yml;

  # ── gh-dash ───────────────────────────────────────────────────────────
  xdg.configFile."gh-dash/config.yml".source = ../dot_config/gh-dash/config.yml;

  # ── Television ────────────────────────────────────────────────────────
  xdg.configFile."television/config.toml".source = ../dot_config/television/config.toml;

  # Television cable channels
  xdg.configFile."television/cable/alias.toml".source = ../dot_config/television/cable/alias.toml;
  xdg.configFile."television/cable/aws-buckets.toml".source = ../dot_config/television/cable/aws-buckets.toml;
  xdg.configFile."television/cable/aws-instances.toml".source = ../dot_config/television/cable/aws-instances.toml;
  xdg.configFile."television/cable/bash-history.toml".source = ../dot_config/television/cable/bash-history.toml;
  xdg.configFile."television/cable/dirs.toml".source = ../dot_config/television/cable/dirs.toml;
  xdg.configFile."television/cable/docker-images.toml".source = ../dot_config/television/cable/docker-images.toml;
  xdg.configFile."television/cable/dotfiles.toml".source = ../dot_config/television/cable/dotfiles.toml;
  xdg.configFile."television/cable/env.toml".source = ../dot_config/television/cable/env.toml;
  xdg.configFile."television/cable/files.toml".source = ../dot_config/television/cable/files.toml;
  xdg.configFile."television/cable/fish-history.toml".source = ../dot_config/television/cable/fish-history.toml;
  xdg.configFile."television/cable/git-branch.toml".source = ../dot_config/television/cable/git-branch.toml;
  xdg.configFile."television/cable/git-diff.toml".source = ../dot_config/television/cable/git-diff.toml;
  xdg.configFile."television/cable/git-log.toml".source = ../dot_config/television/cable/git-log.toml;
  xdg.configFile."television/cable/git-reflog.toml".source = ../dot_config/television/cable/git-reflog.toml;
  xdg.configFile."television/cable/git-repos.toml".source = ../dot_config/television/cable/git-repos.toml;
  xdg.configFile."television/cable/mnt-dir.toml".source = ../dot_config/television/cable/mnt-dir.toml;
  xdg.configFile."television/cable/my-awesome-channel.toml".source = ../dot_config/television/cable/my-awesome-channel.toml;
  xdg.configFile."television/cable/nu-history.toml".source = ../dot_config/television/cable/nu-history.toml;
  xdg.configFile."television/cable/text.toml".source = ../dot_config/television/cable/text.toml;
  xdg.configFile."television/cable/zsh-history.toml".source = ../dot_config/television/cable/zsh-history.toml;
}
