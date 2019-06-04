###############################################################################
# Exports                                                              #
###############################################################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

###############################################################################
# Z shell                                                              #
###############################################################################

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(  status custom_icon dir )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Custom icon
POWERLEVEL9K_CUSTOM_ICON="echo -n $'\uf113'"
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND="white"

# Time
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

# Git icon
POWERLEVEL9K_VCS_GIT_ICON='\uf7a3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf7a3'
POWERLEVEL9K_HIDE_BRANCH_ICON=true

# Directories
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_VCS_SHORTEN_LENGTH=19
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=19
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

# Misc
DISABLE_AUTO_TITLE="true"
POWERLEVEL9K_COLOR_SCHEME='light'

POWERLEVEL9K_MODE='nerdfont-complete'

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

. ~/.oh-my-zsh/z.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

###############################################################################
# Aliases                                                              #
###############################################################################

# Easier navigation: .., ..., ...., .....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias reload=". ~/.zshrc"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias c="code ."
alias cdp="cd ~/Projects"
alias cdderiveddata="cd ~/Library/Developer/Xcode/DerivedData"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

###############################################################################
# Functions                                                              #
###############################################################################

function mitmproxyenableandrun {
	echo "Enabling WI-FI web proxy and secure web proxy"
	networksetup -setwebproxystate wi-fi on
	networksetup -setsecurewebproxystate wi-fi on
	echo "Starting mitmproxy"
	mitmproxy
}

function mitmproxydisable {
	echo "Disabling WI-FI web proxy and secure web proxy"
	networksetup -setwebproxystate wi-fi off
	networksetup -setsecurewebproxystate wi-fi off
}

function mitmproxyconfiguresimulator {
	if [ "$#" -ne 1 ]; then
		echo "Usage: mitmproxyconfiguresimulator <ADVTrustStore location>"
	else
		cd $1
		./iosCertTrustManager.py -a ~/.mitmproxy/mitmproxy-ca-cert.pem
		cd -
	fi
}

function recordiOSsimulator {
	if [ "$#" -ne 1 ]; then
		echo "Usage: recordiOSsimulator <target path to mp4 file>"
	else
		xcrun simctl io booted recordVideo --type=mp4 $1
	fi
}
export PATH="/usr/local/sbin:$PATH"
