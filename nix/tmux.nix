{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "xterm-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      catppuccin
      yank
    ];

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Pane base index
      set -g pane-base-index 1
      set-option -g renumber-windows on

      # Status bar position
      set-option -g status-position top

      # Vi copy-mode keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open splits/windows in current path
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Popup terminal (Ctrl-A)
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n C-a if-shell "$is_vim" \
          "send-keys C-a" \
          "if-shell -F '#{==:#{session_name},popup}' 'detach-client' 'display-popup -d \"#{pane_current_path}\" -w 80% -h 80% -E \"tmux new-session -A -s popup\"'"

      # Popup tools
      bind-key -n C-, if-shell "$is_vim" "send-keys C-," "display-popup -E 'htop'"
      bind-key -n C-n if-shell "$is_vim" "send-keys C-n" "display-popup -E 'nvtop'"
      bind-key -n C-g if-shell "$is_vim" "send-keys C-g" "display-popup -w 80% -h 80% -E 'gh dash'"
    '';
  };
}
