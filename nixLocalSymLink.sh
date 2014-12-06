#!/bin/sh

# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

########################################
### Configurazione di zsh
########################################
if [ ! -d "$HOME/.nixpkgs" ]
then
   mkdir "$HOME/.nixpkgs/"
fi

if [ -f "$HOME/.nixpkgs/config.nix" ]
then
   rm "$HOME/.nixpkgs/config.nix"
fi

ln -s "$scriptDir/nix-local/config.nix" "$HOME/.nixpkgs/config.nix"
