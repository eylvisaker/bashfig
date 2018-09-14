#!/bin/bash

if [ -f ~/.bashfig/system/.bashrc ]; then
	source ~/.bashfig/system/.bashrc
fi

if [ -f .machine_profile ]; then
	source .machine_profile
fi

export PATH=$PATH:~/.local/bin

# Set the colors for ls
LS_COLORS='rs=0:di=93:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;93;45:st=37;44:ex=01;92:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# Customize and colorize the prompt
parse_git_branch () {
  local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [[ -z $branch ]]; then
    echo ""
  else
    local color="\e[94m"   # if working directory is clean
    local untracked=`git ls-files -o --exclude-standard 2> /dev/null | wc -l`
    local modified=`git ls-files -m 2> /dev/null | wc -l`
    local staged=`git diff --name-only --cached 2> /dev/null | wc -l`
    local unmerged=`git diff --name-only --diff-filter=U 2> /dev/null | wc -l`
    local ahead_behind=`git status -sb | grep '\[' | cut -d "[" -f2 | cut -d "]" -f1`
    local published=`git status -sb | grep -e '\.\.\..'`
    local message=""

    if [[ ! -z $ahead_behind ]]; then color="\e[92m"; message="\e[92m$ahead_behind"; fi
    if [[ -z $published ]];      then color="\e[92m"; message="\e[92munpublished $message"; fi
    if [[ $untracked > 0 ]];     then color="\e[94m"; message="\e[94m$untracked untracked $message"; fi
    if [[ $modified > 0 ]];      then color="\e[95m"; message="\e[95m$modified modified $message"; fi
    if [[ $staged > 0 ]];        then color="\e[96m"; message="\e[96m$staged staged $message"; fi
    if [[ $unmerged > 0 ]];      then color="\e[91m"; message="\e[91m$unmerged unmerged $message"; fi

    if [[ -z $message ]]; then
      echo -e " $color($branch)"
    else
      local trimmed_message="${message%"${message##*[![:space:]]}"}" 
      echo -e " $color($branch) \e[0m[$trimmed_message\e[0m]"
    fi
  fi
}

clean_pwd() {
  echo $PWD | sed -e "s:^$HOME:~:"
}

set_bash_prompt() {
  PS1="[\e[92;1m\u\e[0m] \e[96m\h\e[0m:\e[93m\$(clean_pwd)\e[92;1m\$(parse_git_branch)\e[0m\n\e[93;1m$\e[0m "
}

PROMPT_COMMAND=set_bash_prompt

# Colorize gcc compilation errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
alias ll='ls -lA --color=auto'
alias ls='ls --color=auto'

# Make tab completion case-insensitive
bind 'set completion-ignore-case on'

