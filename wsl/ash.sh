# Path
export PATH="/opt/cmake/bin:/opt/node/bin:/opt/vcpkg:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Files
umask 0022

# Limits
ulimit -S -c 0

# Unicode
export NCURSES_NO_UTF8_ACS="1"
export MM_CHARSET="UTF-8"

# Localization
export LANG="C.UTF-8"
export LC_MESSAGES="C.UTF-8"
export LC_COLLATE="C.UTF-8"
export LC_CTYPE="C.UTF-8"
export LC_ALL=

# Applications
export EDITOR="vim"
export PAGER="less"

# Ports
export VSCMD_SKIP_SENDTELEMETRY=1
export VCPKG_KEEP_ENV_VARS=VSCMD_SKIP_SENDTELEMETRY
export VCPKG_DEFAULT_TRIPLET="x64-linux"
export VCPKG_DOWNLOADS="/opt/downloads"
export VCPKG_ROOT="/opt/vcpkg"

# Colors
export CLICOLOR=1
export LSCOLORS="ExGxFxdxCxDxDxBxAbBxFx"
export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;30;41:tw=1;31:ow=1;35"

# Aliases
alias ..="cd .."

alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lh --time-style long-iso"
alias lsa="ls -A"
alias lla="ll -A"

alias tm="tmux -2"
alias ta="tm attach -t"
alias ts="tm new-session -s"
alias tl="tm list-sessions"

alias crush="pngcrush -brute -reduce -rem allb -ow"
alias grep="grep --color=auto"
alias sudo="sudo "

# Settings
export HISTFILE="${HOME}/.history"

PS1=
if [ -n "${TMUX}" ]; then
  id="$(echo $TMUX | awk -F, '{print $3 + 1}')"
  session="$(tmux ls | head -${id} | tail -1 | cut -d: -f1)"
  PS1="${PS1}\[\e[90m\][\[\e[0m\]${session}\[\e[90m\]]\[\e[0m\] "
fi
if [ $(id -u) -ne 0 ]; then
  PS1="${PS1}\[\e[32m\]\u\[\e[0m\]"
else
  PS1="${PS1}\[\e[31m\]\u\[\e[0m\]"
fi
PS1="${PS1}@\[\e[32m\]\h\[\e[0m\]"
PS1="${PS1} \[\e[34m\]\w\[\e[0m\] "
export PS1

if [ -x "/bin/wslpath" ] && [ -f "/mnt/c/Windows/System32/cmd.exe" ]; then
  export CMD="/mnt/c/Windows/System32/cmd.exe"
  USER_PROFILE="$(/bin/wslpath -a $(${CMD} /C 'echo %UserProfile%' 2>/dev/null | sed 's/\r//g') 2>/dev/null)" \
    && export USER_PROFILE
fi
