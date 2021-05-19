# History settings
# Save x items to the given history file
# https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
HISTSIZE=50000000
SAVEHIST=50000000

# Append history to the zsh_history file
setopt APPEND_HISTORY

# Write to history after each command
setopt INC_APPEND_HISTORY

# Write the running time of commands to the history
# NOTE: the zsh documentation says this and INC_APPEND_HISTORY are mutually
# exclusive, but this seems to work fine.
setopt INC_APPEND_HISTORY_TIME

# Ignore duplicates in zsh history
setopt HIST_IGNORE_ALL_DUPS

# Ignore commands for history that start with a space
setopt HIST_IGNORE_SPACE

# Remove superfluous blanks from each line being added to the history list
setopt HIST_REDUCE_BLANKS

# After !! previous command don't execute, allow editing
setopt HIST_VERIFY

# Jump to end after completion
setopt ALWAYS_TO_END

# Show menu after multiple tabs
setopt AUTO_MENU

# No beep
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Warn before quitting with background jobs
setopt CHECK_JOBS

# Don't ask before running a rm *
setopt RM_STAR_SILENT

# Prefer US English and use UTF-8.
LANG='en_US.UTF-8';
LC_ALL='en_US.UTF-8';