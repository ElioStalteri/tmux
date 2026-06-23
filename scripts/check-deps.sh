#!/usr/bin/env bash

tmux_config_check_deps() {
  local missing=0
  local required=(tmux git bash fzf sesh zoxide bat wt opencode jq)
  local cmd

  for cmd in "${required[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      printf 'tmux-config: missing required dependency: %s\n' "$cmd" >&2
      missing=1
    fi
  done

  if ! command -v pbcopy >/dev/null 2>&1 && \
     ! command -v wl-copy >/dev/null 2>&1 && \
     ! command -v xclip >/dev/null 2>&1 && \
     ! command -v xsel >/dev/null 2>&1 && \
     ! command -v clip.exe >/dev/null 2>&1 && \
     ! command -v termux-clipboard-set >/dev/null 2>&1; then
    printf 'tmux-config: missing clipboard dependency: install one of pbcopy, wl-copy, xclip, xsel, clip.exe, termux-clipboard-set\n' >&2
    missing=1
  fi

  if [[ ! -x ~/.config/tmux/plugins/tpm/tpm ]]; then
    printf 'tmux-config: missing TPM at ~/.config/tmux/plugins/tpm/tpm; clone with --recurse-submodules or run git submodule update --init --recursive\n' >&2
    missing=1
  fi

  if [[ $missing -eq 1 ]]; then
    printf 'tmux-config: install core dependencies with Homebrew:\n' >&2
    printf '  brew install tmux git bash fzf sesh zoxide bat worktrunk opencode jq\n' >&2
    printf 'tmux-config: install one clipboard backend if needed, for example:\n' >&2
    printf '  brew install wl-clipboard\n' >&2
  fi

  return "$missing"
}

tmux_config_check_deps || true
