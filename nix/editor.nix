{ config, ... }:

{
  # Neovim config is managed by LazyVim which handles its own plugins.
  # We just place the config files and let lazy.nvim do the rest.
  xdg.configFile = {
    "nvim/init.lua".source = ../dot_config/nvim/init.lua;
    "nvim/lazyvim.json".source = ../dot_config/nvim/lazyvim.json;
    "nvim/lazy-lock.json".source = ../dot_config/nvim/lazy-lock.json;
    "nvim/lua/config/lazy.lua".source = ../dot_config/nvim/lua/config/lazy.lua;
    "nvim/lua/config/options.lua".source = ../dot_config/nvim/lua/config/options.lua;
    "nvim/lua/config/keymaps.lua".source = ../dot_config/nvim/lua/config/keymaps.lua;
    "nvim/lua/config/autocmds.lua".source = ../dot_config/nvim/lua/config/autocmds.lua;
    "nvim/lua/plugins/example.lua".source = ../dot_config/nvim/lua/plugins/example.lua;
    "nvim/lua/plugins/tmux.lua".source = ../dot_config/nvim/lua/plugins/tmux.lua;
    "nvim/lua/plugins/ty.lua".source = ../dot_config/nvim/lua/plugins/ty.lua;
  };
}
