reset

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="rika"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Disable update prompt and just auto-update oh-my-zsh
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.rika

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here,

# Stop the user@host part appearing on the powerline when local, we know what system we're on!
DEFAULT_USER=`whoami`

# Monzo starter back init.
[ -f $HOME/.starter-pack/zshrc ] && source $HOME/.starter-pack/zshrc

# Display the trans flag Monzo logo
source $ZSH_CUSTOM/monzo-trans

# Helpful general custom aliases
alias cpuuid="uuidgen | tee >(cat) | tr -d '\n' | pbcopy"

# Browser aliases
alias chrome="open -a 'Google Chrome'"
alias safari="open -a 'Safari'"

# Monzo specific aliases
alias wearedev="cd ~/src/github.com/monzo/wearedev/"
jira() { chrome https://mondough.atlassian.net/browse/"$@"; }
jirab() { chrome https://mondough.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-'); }
alias confluence="chrome https://mondough.atlassian.net/wiki/discover/all-updates"
taskb() { task list project:$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-'); }

# Open a PR for the current git branch
prme() {
    repo=$(git remote get-url origin|sed "s/:/\\//; s/\\.git//; s/git@/https:\\/\\//")
    branch=$(git rev-parse --abbrev-ref HEAD)
    chrome "${repo}/compare/${branch}?expand=1"
}

# Push the current branch to origin (most likely GitHub)
pushb() {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}
