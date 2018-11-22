jira() { chrome https://tools.skybet.net/jira/browse/"$@"; }
jirab() { chrome https://tools.skybet.net/jira/browse/$(git rev-parse --abbrev-ref HEAD | cut -f1,2 -d'-'); }
alias confluence="chrome https://tools.skybet.net/confluence/display/CAS/Casino+Home"
