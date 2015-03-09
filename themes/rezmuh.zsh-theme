ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg_bold[yellow]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}%{$fg_bold[yellow]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[yellow]%}]%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
VIM_INSERT_MODE="%B%{$fg_bold[blue]%}%#%{$reset_color%}%b "
VIM_COMMAND_MODE="%B%{$fg_bold[red]%}%#%{$reset_color%}%b "
vim_mode=$VIM_INSERT_MODE


vcs_status() {
    if [[ ( $(whence in_svn) != "" ) && ( $(in_svn) == 1 ) ]]; then
        svn_prompt_info
    else
        git_prompt_info
    fi
}

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${VIM_COMMAND_MODE}}/(main|viins)/${VIM_INSERT_MODE}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$VIM_INSERT_MODE
}
zle -N zle-line-finish

PROMPT='${vim_mode}'
RPROMPT=' $(vcs_status)%U%D{%r}%u %{$fg_bold[red]%}«!%!»%{$reset_color%}'
