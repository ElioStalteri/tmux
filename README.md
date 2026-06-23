# Tmux Workspace

Portable tmux setup with `sesh`, `fzf`, `zoxide`, Worktrunk, OpenCode, mouse support, copy-mode, and a custom Catppuccin status bar.

## Setup

```sh
git clone --recurse-submodules git@github.com:ElioStalteri/tmux.git ~/.config/tmux
chmod +x ~/.config/tmux/scripts/*
printf '\nsource ~/.config/tmux/scripts/entrypoint.sh\n' >> ~/.bashrc
```

For zsh, use:

```sh
printf '\nsource ~/.config/tmux/scripts/entrypoint.sh\n' >> ~/.zshrc
```

Start tmux and install plugins with TPM:

```text
Ctrl-b I
```

If you cloned without submodules:

```sh
cd ~/.config/tmux
git submodule update --init --recursive
```

## Deps

Core dependencies with Homebrew:

```sh
brew install tmux git bash fzf sesh zoxide bat worktrunk jq
```

Linux clipboard backend if needed:

```sh
brew install wl-clipboard
```

Required commands:

```text
tmux git bash fzf sesh zoxide bat wt jq
```

Clipboard requires at least one of:

```text
pbcopy wl-copy xclip xsel clip.exe termux-clipboard-set
```

## Usage

Tmux keymaps:

```text
prefix s     session picker
prefix S     session picker
prefix q     detach client
prefix Q     kill session with confirmation
prefix C-l   switch to last sesh session

prefix a     custom action picker
prefix w     window picker with preview
prefix h     previous window
prefix l     next window
prefix n     new window
prefix x     kill current window

prefix H/J/K/L   select pane left/down/up/right

prefix v     copy-mode
prefix /     search in copy-mode
```

Session picker keys:

```text
Enter     connect/switch
Ctrl-t    toggle tmux sessions and zoxide/config entries
Ctrl-d    kill selected tmux session
Ctrl-/    toggle preview
Ctrl-u    preview scroll up
Ctrl-f    preview scroll down
```

Window picker keys:

```text
Enter     switch window
Ctrl-d    kill selected window
Ctrl-/    toggle preview
Ctrl-u    preview scroll up
Ctrl-f    preview scroll down
```

Custom actions live in `~/.config/tmux/actions.local.tsv`. The file is gitignored and is created with default actions the first time the picker runs. Add one action per line using TSV format:

```text
Label<TAB>tmux-command
```

Commands can be normal tmux commands without the `tmux` prefix:

```text
Dev + Lazygit	new-window -n dev \; send-keys 'just dev' C-m \; split-window -h \; send-keys 'lazygit' C-m
```

Shell helpers:

```sh
tx
```

Open the session picker outside tmux.

```sh
txa feature-branch "Implement the task"
```

Create a Worktrunk branch/worktree from the default branch, start a detached tmux session named `repo_branch`, and launch OpenCode with a prompt.

```sh
txa -s feature-branch "Implement the task"
```

Create and switch to the new session immediately.

```sh
txa --dry-run feature-branch "Implement the task"
```

Preview what would run.

```sh
wtl
```

Open a Worktrunk picker powered by `wt list --format=json`.

`wtl` keys:

```text
Enter     wt switch selected branch
Ctrl-d    wt remove selected branch
Ctrl-/    toggle preview
```

Status bar:

```text
session | windows | git branch | time
```

The git branch pill is hidden outside Git repositories.
