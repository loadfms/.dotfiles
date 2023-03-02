### colorscheme ###

# change window screen colors
set-option -wg mode-style bg="#f5bde6",fg="#5b6078"

# default statusbar colors (terminal bg should be #282828)
set-option -g status-style bg=terminal,fg="#cad3f5"

# default window title colors
set-option -wg window-status-style bg="#5b6078",fg="#cad3f5"

# colors for windows with activity
set-option -wg window-status-activity-style bg="#5b6078",fg="#cad3f5"

# colors for windows with bells
set-option -wg window-status-bell-style bg="#5b6078",fg="#f5bde6"

# active window title colors
set-option -wg window-status-current-style bg="#f5bde6",fg="#5b6078"

# pane border
set-option -g pane-active-border-style fg="#f5bde6"
set-option -g pane-border-style fg="#5b6078"

# message info
set-option -g message-style bg="#f5bde6",fg="#5b6078"

# writing commands inactive
set-option -g message-command-style bg="#cad3f5",fg="#5b6078"

# pane number display
set-option -g display-panes-active-colour "#f5bde6"
set-option -g display-panes-colour "#5b6078"

# clock
set-option -wg clock-mode-colour "#f5bde6"

# copy mode highlighting
%if #{>=:#{version},3.2}
    set-option -wg copy-mode-match-style "bg=#cad3f5,fg=#5b6078"
    set-option -wg copy-mode-current-match-style "bg=#f5bde6,fg=#5b6078"
%endif

# statusbar formatting
# "#f5bde6" MUST be in lowercase here (conflicts with statusline alias otherwise)
set-option -g status-left "#[bg=#cad3f5, fg=#5b6078]#{?client_prefix,#[bg=#f5bde6],#[bg=#cad3f5]} #{session_name} "
set-option -g status-right "#[bg=#5b6078, fg=#cad3f5] %Y-%m-%d %H:%M:%S #[bg=#cad3f5, fg=#5b6078]#{?client_prefix,#[bg=#f5bde6],#[bg=#cad3f5]} #{host_short} "

set-option -wg window-status-current-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
set-option -wg window-status-format "#{?window_zoomed_flag,#[fg=default bold],#[fg=default]} #{window_index} #{window_name} "
