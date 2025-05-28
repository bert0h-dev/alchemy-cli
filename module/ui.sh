# ~/.alchemy/modules/ui.sh

function show_theme_menu() {
  THEMES=("default" "dark" "retro")
  SELECTED_THEME=$(printf '%s\n' "${THEMES[@]}" | gum choose)

  if [ -n "$SELECTED_THEME" ]; then
    load_theme "$SELECTED_THEME"
    gum style --foreground 46 "✔ Tema cambiado a '$SELECTED_THEME'"
  else
    gum style --foreground 196 "✘ No se seleccionó ningún tema."
  fi
}

function alchemy_menu_interactive() {
  SELECTION=$(gum choose "Git" "Python" "Node" "Salir")

  case "$SELECTION" in
    Git)
      gum style --border normal --margin "1" --padding "1" "Git Commands:"
      gum input --placeholder "Mensaje de commit..." | xargs git commit -m
      ;;
    Python)
      gum confirm "¿Crear entorno virtual?" && python -m venv env
      ;;
    Node)
      gum spin --title "Instalando dependencias..." -- npm install
      ;;
    Salir)
      gum style --foreground 214 "Saliendo..."
      exit 0
      ;;
  esac
}