#!/usr/bin/env bash

tx() {
  ~/.config/tmux/scripts/tmux-session-picker tmux
}

txa() {
  ~/.config/tmux/scripts/tmux-worktrunk-agent "$@"
}

wtl() {
  local branch
  branch=$(~/.config/tmux/scripts/worktrunk-picker) || return
  [[ -n "$branch" ]] && wt switch "$branch"
}
