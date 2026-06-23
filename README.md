# Tmux Workspace

A portable tmux setup for project/session navigation with `sesh`, `fzf`, `zoxide`, Worktrunk, OpenCode, mouse support, copy-mode, and a custom Catppuccin status bar.

This repository is designed to be cloned directly into:

```sh
~/.config/tmux
```

## Dependencies

Required commands:

```text
tmux
git
bash
fzf
sesh
zoxide
bat
wt
opencode
jq
```

Clipboard requires at least one of:

```text
pbcopy
wl-copy
xclip
xsel
clip.exe
termux-clipboard-set
```

On macOS or Linux with Homebrew, install the core dependencies with:

```sh
brew install tmux git bash fzf sesh zoxide bat worktrunk opencode jq
```

On Linux, install one clipboard backend if your distribution does not already provide one:

```sh
brew install wl-clipboard
```

## Install

Clone with submodules so TPM is available:

```sh
git clone --recurse-submodules <repo-url> ~/.config/tmux
```

If you already cloned without submodules:

```sh
cd ~/.config/tmux
git submodule update --init --recursive
```

Make scripts executable:

```sh
chmod +x ~/.config/tmux/scripts/*
```

Add this to your `~/.bashrc` or `~/.zshrc`:

```sh
source ~/.config/tmux/scripts/check-deps.sh
source ~/.config/tmux/scripts/shell-functions.sh
```

Start tmux and install plugins with TPM:

```text
prefix + I
```

By default the tmux prefix is the standard `Ctrl-b`.

## TPM Submodule

TPM is included as a Git submodule at:

```text
plugins/tpm
```

For a fresh clone, prefer:

```sh
git clone --recurse-submodules <repo-url> ~/.config/tmux
```

If you already cloned without submodules:

```sh
cd ~/.config/tmux
git submodule update --init --recursive
```

To update TPM later:

```sh
cd ~/.config/tmux
git submodule update --remote plugins/tpm
git add plugins/tpm
git commit -m "update tpm"
```

If tmux says TPM is missing, check that this file exists and is executable:

```sh
~/.config/tmux/plugins/tpm/tpm
```

## Tmux Keymaps

Sessions:

```text
prefix s     open session picker
prefix S     open session picker
prefix q     detach client
prefix Q     kill session with confirmation
prefix C-l   switch to last sesh session
```

Inside the session picker:

```text
Enter     connect/switch
Ctrl-t    toggle tmux sessions and zoxide/config entries
Ctrl-d    kill selected tmux session
Ctrl-/    toggle preview
Ctrl-u    preview scroll up
Ctrl-f    preview scroll down
```

Windows:

```text
prefix w     open window picker with preview
prefix h     previous window
prefix l     next window
prefix n     new window
prefix x     kill current window
```

Inside the window picker:

```text
Enter     switch window
Ctrl-d    kill selected window
Ctrl-/    toggle preview
Ctrl-u    preview scroll up
Ctrl-f    preview scroll down
```

Panes:

```text
prefix H/J/K/L   select pane left/down/up/right
```

Copy/search:

```text
prefix v     copy-mode
prefix /     search in copy-mode
v            begin selection in copy-mode
y            copy selection
```

Mouse mode is enabled.

## Shell Functions

`tx` opens the session picker outside tmux:

```sh
tx
```

`txa` creates a Worktrunk branch/worktree from the default branch, starts a detached tmux session named `repo_branch`, and launches OpenCode with a prompt:

```sh
txa feature-branch "Implement the task"
```

Switch to the new session immediately:

```sh
txa -s feature-branch "Implement the task"
```

Preview what would run:

```sh
txa --dry-run feature-branch "Implement the task"
```

`wtl` opens a Worktrunk picker powered by `wt list --format=json`:

```sh
wtl
```

Inside `wtl`:

```text
Enter     wt switch selected branch
Ctrl-d    wt remove selected branch
Ctrl-/    toggle preview
```

## Notes

The status bar shows:

```text
session | windows | git branch | time
```

The right-side git branch pill is hidden automatically outside Git repositories.
