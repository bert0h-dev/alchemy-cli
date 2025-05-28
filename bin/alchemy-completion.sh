#!/usr/bin/env bash
# source "$HOME/.alchemy/bin/alchemy-completion.sh"

_alchemy_completion() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # Comandos principales
  local main_commands="help theme plugin history config update init"

  case "${prev}" in
    theme)
      opts="default dark retro list menu"
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
      ;;
    plugin)
      opts="list install remove menu help"
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
      ;;
    config)
      opts="get set reset"
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
      ;;
    *)
      COMPREPLY=( $(compgen -W "${main_commands}" -- ${cur}) )
      return 0
      ;;
  esac
}

complete -F _alchemy_completion alchemy