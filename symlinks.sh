#!/bin/sh

# Eseguire questo script come amministratore!

# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

# Symlink per i file di configurazione globali
rm -r /etc/nixos
ln -s "$scriptDir/nixos" /etc/nixos

# Symlink per i file di configurazione di xmonad
if [ -d "$HOME/.xmonad" ]
then
   rm -r "$HOME/.xmonad"
fi

mkdir "$HOME/.xmonad"
ln -s "$scriptDir/xmonad/xmonad.hs" "$HOME/.xmonad/xmonad.hs"
