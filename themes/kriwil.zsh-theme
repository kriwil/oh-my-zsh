# Found on the ZshWiki
#  http://zshwiki.org/home/config/prompt

# function virtualenv_info {
#     [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
# }

# local git_info='$(git_prompt_info)'
# ZSH_THEME_GIT_PROMPT_PREFIX="("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")"
# ZSH_THEME_GIT_PROMPT_DIRTY=" x"
# ZSH_THEME_GIT_PROMPT_CLEAN=" o"


# PROMPT="%n@%m \
# %~ \
# ${git_info}
# $ "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
VIM_INSERT_MODE="%{$fg_bold[yellow]%}$%{$reset_color%}"
VIM_COMMAND_MODE="%{$fg_bold[red]%}:%{$reset_color%}"

vcs_status() {
    if [[ ( $(whence in_svn) != "" ) && ( $(in_svn) == 1 ) ]]; then
        svn_prompt_info
    else
        git_prompt_info
    fi
}

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$VIM_COMMAND_MODE}/(main|viins)/$VIM_INSERT_MODE}"
}

RPROMPT='$(vcs_status)%2~'
# PROMPT='$(vi_mode_prompt_info)%b '
PROMPT='$ '
