#!/bin/bash
# ~/.alchemy/init.sh

# chmod +x init.sh module/*.sh plugins/*.sh scripts/*.sh config/*.json bin/alchemy config/themes/*.json

set -e

ALCHEMY_HOME="$HOME/.alchemy"
BINARY_URL="https://github.com/bert0h-dev/alchemy-cli/releases/latest/download/alchemy-cli.tar.gz "

echo -e "\033[1;35m🔮 Instalando Alchemy CLI...\033[0m"

mkdir -p "$ALCHEMY_HOME"
cd "$ALCHEMY_HOME"

if ! command -v curl >/dev/null; then
  echo "Error: Se requiere 'curl'. Por favor instálalo primero."
  exit 1
fi

# Descargar última versión
curl -fsSL "$BINARY_URL" | tar xzf -

# Asegurarse de tener permisos
chmod +x alchemy

# Agregar a PATH si no está
if ! grep -q 'ALCHEMY_HOME' ~/.bashrc && ! grep -q 'ALCHEMY_HOME' ~/.zshrc; then
  echo 'export ALCHEMY_HOME="$HOME/.alchemy"' >> ~/.bashrc
  echo 'export PATH="$ALCHEMY_HOME:$PATH"' >> ~/.bashrc
  source ~/.bashrc
fi

echo -e "\033[1;32m✔ Alchemy instalado. Usa 'alchemy' para comenzar.\033[0m"