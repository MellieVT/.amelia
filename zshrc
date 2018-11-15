# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="rika"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Disable update prompt and just auto-update oh-my-zsh
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Use another custom folder than $ZSH/custom
ZSH_CUSTOM=~/.rika

# Define plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.rika/plugins/
plugins=(
  git
  kubectl
  helm
  rika-monzo
)

source $ZSH/oh-my-zsh.sh

# Stop the user@host part appearing on the powerline when local, we know what system we're on!
DEFAULT_USER=`whoami`

# Enable Monzo SSHless workflows
NO_MONZO_SSH=true
# Monzo starter back init.
[ -f $HOME/.starter-pack/zshrc ] && source $HOME/.starter-pack/zshrc

# Display the trans flag Monzo logo
source $ZSH_CUSTOM/monzo-trans

# Display task list
task

# Taskwarrior
# List tasks for branch
taskb() {
    task list project:$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-');
}

# Create generic task list for a work PR
taskbc() {
    branch=$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-');
    task add +work project:${branch} "Push branch"
    task add +work project:${branch} depends:$(task +LATEST limit:1 ids) "Open pull request"
    task add +work project:${branch} depends:$(task +LATEST limit:1 ids) "Get code review"
    task add +work project:${branch} depends:$(task +LATEST limit:1 ids) "Deploy to s101"
    task add +work project:${branch} depends:$(task +LATEST limit:1 ids) "Test in staging"
    task add +work project:${branch} depends:$(task +LATEST limit:1 ids) "Deploy to production"
}
