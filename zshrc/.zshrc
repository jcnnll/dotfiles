#-----------------------------------------------------
# Init prompt and zoxide
#-----------------------------------------------------

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

#-----------------------------------------------------
# Default editor
#-----------------------------------------------------

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

#-----------------------------------------------------
# Add paths
#-----------------------------------------------------

export PATH="$(brew --prefix)/bin:$PATH"

#-----------------------------------------------------
# Configure fzf
#-----------------------------------------------------

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d8caac,bg:-1,hl:#a7c080
  --color=fg+:#d8caac,bg+:#505a60,hl+:#a7c080
  --color=info:#87c095,prompt:#d39bb6,pointer:#83b6af
  --color=marker:#e68183,spinner:#d9bb80,header:#83b6af
  --color=gutter:-1'


#-----------------------------------------------------
# Tmux Sessionizer
#-----------------------------------------------------

new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [-s "$session_name" ]; then
    notify-send "$notification"
  fi
}



#-----------------------------------------------------
# Aliases
#-----------------------------------------------------

alias cl="clear"
alias v="nvim"
alias ks="tmux kill-session"
alias kt="tmux kill-server"
alias ds="tmux detach"
alias tm=new_tmux

