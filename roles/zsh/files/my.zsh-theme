# ZSH Theme
# Thanks to lukerandall, upon whose theme this is based - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme lukerandall is based

local return_code="%(?..%{$fg_bold[red]%}%? ↵%b"

function my_git_prompt_info() {
#  [[ `pwd` == "$HOME" ]] && exit
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/} $(git_prompt_short_sha)$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='$(virtualenv_prompt_info)$(my_git_prompt_info)%{[03m%}%{$fg[cyan]%}%3~%b %(?.%{$fg_bold[white]%}.%{$fg_bold[red]%})»%b '
#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%b "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"
