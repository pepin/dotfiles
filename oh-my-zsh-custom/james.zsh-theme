#!/usr/bin/env zsh
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]
INS_MODE_COLOR=$FG[260]
CMD_MODE_COLOR=$FG[160] # red for command mode

if [ -e $HOME/.bash_prompt_colors ]; then
    . $HOME/.bash_prompt_colors
else
    PROMPT_COLOR_NUM="32"
fi
PROMPT='%{$FG[$PROMPT_COLOR_NUM]%}[%n@%m]%{$reset_color%}%{$PROMPT_SUCCESS_COLOR%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status)%{$reset_color%}$JP_SESSION_PROMPT_MARKER$(vi_mode_prompt_or ᐅ) '

function vi_mode_prompt_or(){
  if [ "$KEYMAP" = "vicmd" ]; then
      echo "%{$CMD_MODE_COLOR%}   $1%{$reset_color%}"
  else
      echo "%{$INS_MODE_COLOR%} --$1%{$reset_color%}"
  fi
}

#RPS1=""

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
