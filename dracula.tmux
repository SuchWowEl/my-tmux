#!/usr/bin/env bash

# Dracula inspired color scheme for tmux
# Author: Dane Williams

main()
{
	# Dracula Color Palette
	background_color='#282a36'
	current_line_color='#44475a'
	foreground_color='#f8f8f2'
	comment_color='#6272a4'
	cyan='#8be9fd'
	green='#50fa7b'
	orange='#ffb86c'
	pink='#ff79c6'
	purple='#bd93f9'
	red='#ff5555'
	yellow='#f1fa8c'

	tmux set-option -g default-terminal "screen-256color"
	
	# border for panes
	tmux set-option -g pane-border-style-fg "${comment_color}"
	tmux set-option -g pane-active-border-style-fg "${pink}"

	# message text
	tmux set-option -g message-style-bg "${current_line_color}"
	tmux set-option -g message-style-fg "${cyan}"

	# status line
	tmux set-option -g status on
	tmux set-option -g status-style-bg "${current_line_color}"
	tmux set-option -g status-style-fg "${purple}"
	tmux set-option -g status-interval 1

	# left
	tmux set-option -g status-left "#[bg=${foreground_color}]#[fg=${background_color}]#{?client_prefix,#[bg=${pink}],} ☺"
	tmux set-option -ga status-left "#[bg=${current_line_color}]#[fg=${pink}] #{?window_zoomed_flag, ↕  ,   }"

	# right
	tmux set-option -g status-right "#[fg=${cyan},bg=${current_line_color}]#[fg=${current_line_color},bg=${cyan}] #(tmux-mem-cpu-load -g 5 --interval 2) "
	tmux set-option -ga status-right "#[fg=${pink},bg=${cyan}]#[fg=${current_line_color},bg=${pink}] #(${uptime | cut -f 4-5 -d " " | cut -f 1 -d ","}) "
	tmux set-option -ga status-right "#[fg={purple},bg=${pink}][fg=${foreground_color},bg=${purple}] %a %H:%M:%S #[fg=${comment_color}]%Y-%m-%d "

	# window status
	tmux set-window-option -g window-status-style "fg=${purple}, bg=${background_color}"
	tmux set-window-option -g window-status-current-style "fg=${pink}, bg=${background_color}"
	tmux set-window-option -g windows-status-current-format "#[fg=current_line_color]#[bg=${purple}][fg=${foreground_color}]#[bg=${purple}] #I #W #[fg=${purple}]#[bg=${current_line_color}]"
}

