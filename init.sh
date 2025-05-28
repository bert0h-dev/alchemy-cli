#!/bin/bash
# ~/.alchemy/init.sh

# chmod +x init.sh module/*.sh plugins/*.sh scripts/*.sh config/*.json bin/alchemy config/themes/*.json

# Definir ALCHEMY_HOME si no está definido
export ALCHEMY_HOME="${ALCHEMY_HOME:=$HOME/.alchemy}"

# Cargar módulos dinámicamente
for module in "$ALCHEMY_HOME"/modules/*.sh; do
  if [ -f "$module" ]; then
    source "$module"
  fi
done

# Añadir bin a PATH si existe
if [ -d "$ALCHEMY_HOME/bin" ]; then
  export PATH="$ALCHEMY_HOME/bin:$PATH"
fi

# Mensaje de bienvenida con color
echo -e "\033[1;35m┌──────────────────────────────┐\033[0m"
echo -e "\033[1;35m│        🔮 ALCHEMY CLI        │\033[0m"
echo -e "\033[1;35m│     El arte de lo mágico     │\033[0m"
echo -e "\033[1;35m└──────────────────────────────┘\033[0m"