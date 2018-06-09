jira() { chrome https://mondough.atlassian.net/browse/"$@"; }
jirab() { chrome https://mondough.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-'); }
alias confluence="chrome https://mondough.atlassian.net/wiki/discover/all-updates"