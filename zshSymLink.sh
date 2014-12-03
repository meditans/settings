#!/bin/sh

# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

########################################
### Configurazione di zsh
########################################
if [ -f "$HOME/.zshrc" ]
then
   rm "$HOME/.zshrc"
fi

ln -s "$scriptDir/zsh/zshrc" "$HOME/.zshrc"
