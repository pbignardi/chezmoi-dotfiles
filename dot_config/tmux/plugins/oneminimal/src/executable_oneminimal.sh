#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $current_dir/utils.sh

# load colorscheme
theme_colorscheme=`get @thm_variant "default"`
source $current_dir/$theme_colorscheme.sh

tmux set-option -gq "status" "on"
tmux set-option -gq "status-justify" "left"

tmux set-option -gq "status-left-length" "100"
tmux set-option -gq "status-right-length" "100"
tmux set-option -gq "status-right-attr" "none"

tmux set-option -gq "message-fg" "#{ @thm_fg }"
tmux set-option -gq "message-bg" "#{ @thm_black }"

tmux set-option -gq "message-command-fg" "#{ @thm_fg }"
tmux set-option -gq "message-command-bg" "#{ @thm_fg }"

tmux set-option -gq "status-attr" "none"
tmux set-option -gq "status-left-attr" "none"

tmux set-window-option -gq "window-status-fg" "#{ @thm_fg }"
tmux set-window-option -gq "window-status-bg" "#{ @thm_bg }"
tmux set-window-option -gq "window-status-attr" "none"

tmux set-window-option -gq "window-status-activity-bg" "#{ @thm_bg }"
tmux set-window-option -gq "window-status-activity-fg" "#{ @thm_bg }"
tmux set-window-option -gq "window-status-activity-attr" "none"

tmux set-window-option -gq "window-status-separator" ""

tmux set-option -gq "window-style" "fg=#{@thm_grey}"
tmux set-option -gq "window-active-style" "fg=#{@thm_fg}"


tmux set-option -gq "pane-border-fg" "#{ @thm_fg }"
tmux set-option -gq "pane-border-bg" "#{ @thm_bg }"
tmux set-option -gq "pane-active-border-fg" "#{ @thm_yellow }"
tmux set-option -gq "pane-active-border-bg" "#{ @thm_bg }"

tmux set-option -gq "display-panes-active-colour" "purple"
tmux set-option -gq "display-panes-colour" "grey"

tmux set-option -gq "status-style" "bg=#{@thm_bg},fg=#{@thm_fg}"

tmux set-option -gq "@prefix_highlight_fg" "#{ @thm_bg }"
tmux set-option -gq "@prefix_highlight_bg" "{ @thm_green }"
tmux set-option -gq "@prefix_highlight_copy_mode_attr" "fg=#{@thm_bg},bg=#{@thm_green}"
tmux set-option -gq "@prefix_highlight_output_prefix" " / "

time_format="%R"
date_format="%d/%m/%Y"

tmux set-option -gq "status-right" " #[fg=#{@thm_green}, bg=#{@thm_bg}]${status_widgets} #[fg=#{@thm_grey},bg=#{@thm_bg},nounderscore,italics] $(hostname -s)  #[fg=#{@thm_blue},bg=#{@thm_bg},nounderscore,noitalics]${time_format} "
tmux set-option -gq "status-left" "#[fg=#{@thm_purple},bg=#{@thm_bg},italics]   #S #{prefix_highlight} "

tmux set-option -gq "window-status-format" "#[fg=#{@thm_fg},bg=#{@thm_bg},nobold] #I #W "
tmux set-option -gq "window-status-current-format" "#[fg=#{@thm_green},bg=#{@thm_bg},bold]  #W "
