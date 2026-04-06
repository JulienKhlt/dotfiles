{ config, ... }:

{
  # macOS-specific configurations
  # This module is only imported in the macOS home-manager profile

  # ── AeroSpace (tiling window manager) ─────────────────────────────────
  xdg.configFile."aerospace/aerospace.toml".source = ../dot_config/aerospace/aerospace.toml;

  # ── Karabiner (keyboard remapper) ─────────────────────────────────────
  xdg.configFile."karabiner/karabiner.json".source = ../dot_config/karabiner/karabiner.json;

  # ── Sketchybar (status bar) ───────────────────────────────────────────
  xdg.configFile."sketchybar/sketchybarrc".source = ../dot_config/sketchybar/sketchybarrc;
  xdg.configFile."sketchybar/sketchybarrc-desktop".source = ../dot_config/sketchybar/sketchybarrc-desktop;
  xdg.configFile."sketchybar/sketchybarrc-laptop".source = ../dot_config/sketchybar/sketchybarrc-laptop;
  xdg.configFile."sketchybar/colors.sh".source = ../dot_config/sketchybar/colors.sh;
  xdg.configFile."sketchybar/globalstyles.sh".source = ../dot_config/sketchybar/globalstyles.sh;
  xdg.configFile."sketchybar/icons.sh".source = ../dot_config/sketchybar/icons.sh;
  xdg.configFile."sketchybar/items" = {
    source = ../dot_config/sketchybar/items;
    recursive = true;
  };
  xdg.configFile."sketchybar/plugins" = {
    source = ../dot_config/sketchybar/plugins;
    recursive = true;
  };
}
