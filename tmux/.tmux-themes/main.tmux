### colorscheme ###

# change window screen colors
set-option -wg mode-style bg=magenta,fg=black

# default statusbar colors (terminal bg should be #282828)
set-option -g status-style bg=terminal,fg=white

# default window title colors
set-option -wg window-status-style bg=black,fg=white

# colors for windows with activity
set-option -wg window-status-activity-style bg=black,fg=white

# colors for windows with bells
set-option -wg window-status-bell-style bg=black,fg=magenta

# active window title colors
set-option -wg window-status-current-style bg=magenta,fg=black

# pane border
set-option -g pane-active-border-style fg=magenta
set-option -g pane-border-style fg=black

# message info
set-option -g message-style bg=magenta,fg=black

# writing commands inactive
set-option -g message-command-style bg=white,fg=black

# pane number display
set-option -g display-panes-active-colour magenta
set-option -g display-panes-colour black

# clock
set-option -wg clock-mode-colour magenta

# copy mode highlighting
%if #{>=:#{version},3.2}
    set-option -wg copy-mode-match-style "bg=white,fg=black"
    set-option -wg copy-mode-current-match-style "bg=magenta,fg=black"
%endif

# statusbar formatting
# magenta MUST be in lowercase here (conflicts with statusline alias otherwise)
#set-option -g status-left "#[bg=white, fg=black]#{?client_prefix,#[bg=magenta],#[bg=white]} #{session_name} "
#set-option -g status-right "#[bg=black, fg=white] %Y-%m-%d %H:%M:%S #[bg=white, fg=black]#{?client_prefix,#[bg=magenta],#[bg=white]} #{host_short} "

set-option -g status-left "#[bg=white, fg=black]#{?client_prefix,#[bg=magenta],#[bg=white]} 󰯈  "
set-option -g status-right "#[bg=white, fg=black]#{?client_prefix,#[bg=magenta],#[bg=white]} #{host_short} "
set-option -wg window-status-current-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
set-option -wg window-status-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
