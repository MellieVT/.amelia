# Open a PR for the current git branch
prme() {
    repo=$(git remote get-url origin|sed "s/:/\\//; s/\\.git//; s/git@/https:\\/\\//")
    branch=$(git rev-parse --abbrev-ref HEAD)
    chrome "${repo}/compare/${branch}?expand=1"
}

# Push the current branch to origin
pushb() {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}
