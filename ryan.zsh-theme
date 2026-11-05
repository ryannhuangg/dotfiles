_git_prompt() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  ref=$(command git symbolic-ref HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  local branch="${ref#refs/heads/}"
  local dirty=""
  [[ -n $(command git status --porcelain 2>/dev/null) ]] && dirty=" %F{#C68298}✗"
  echo " %F{#E6C384}[${branch}]${dirty}%f"
}

_user="%F{#98BB6C}%n%f"
_host="%F{#957FB8}@%m%f"
_path="%F{#C68298}%(4~|../%2~|%~)%f"

setopt prompt_subst
PROMPT='${_user}${_host} ${_path}$(_git_prompt) $ '
RPROMPT='%(?..%F{#C68298}? :(%f)'

