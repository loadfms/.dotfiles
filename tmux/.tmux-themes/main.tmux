### colorscheme ###

# change window screen colors
set-option -wg mode-style bg=red,fg=black

# default statusbar colors (terminal bg should be #282828)
set-option -g status-style bg=terminal,fg=white

# default window title colors
set-option -wg window-status-style bg=black,fg=white

# colors for windows with activity
set-option -wg window-status-activity-style bg=black,fg=white

# colors for windows with bells
set-option -wg window-status-bell-style bg=black,fg=red

# active window title colors
set-option -wg window-status-current-style bg=red,fg=black

# pane border
set-option -g pane-active-border-style fg=red
set-option -g pane-border-style fg=black

# message info
set-option -g message-style bg=red,fg=black

# writing commands inactive
set-option -g message-command-style bg=white,fg=black

# pane number display
set-option -g display-panes-active-colour red
set-option -g display-panes-colour black

# clock
set-option -wg clock-mode-colour red

# copy mode highlighting
%if #{>=:#{version},3.2}
    set-option -wg copy-mode-match-style "bg=white,fg=black"
    set-option -wg copy-mode-current-match-style "bg=red,fg=black"
%endif

set-option -g status-left "#[bg=white, fg=black]#{?client_prefix,#[bg=blue],#[bg=white]}   "
# set-option -g status-right "#[bg=white, fg=black]#{?client_prefix,#[bg=red],#[bg=white]} #{host_short} "
set-option -g status-right ""
set-option -wg window-status-current-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
set-option -wg window-status-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
