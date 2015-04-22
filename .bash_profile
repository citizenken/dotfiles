PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source ~/git-completion.bash

export PATH=$PATH:/usr/local/sbin

parse_git_dirty() {
  git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"
}
 
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)$ "

eval `keychain --eval --agents ssh id_rsa`


alias ll='ls -hlGaF --color=auto --group-directories-first'
alias a_npevenv='cd ~/Repositories/platform-core && source ~/Repositories/platform-core/npvenv/bin/activate'
alias a_e2evenv='cd ~/Repositories/csf-e2e && source ~/Repositories/platform-automation/e2evenv/bin/activate'
alias grep='ggrep'
alias bsdgrep='/usr/bin/grep'
alias ghpr="~/ghpr"
