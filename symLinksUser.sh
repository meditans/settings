#!/bin/sh

# Attenzione: Eseguire questo script come utente semplice.

########################################
### Impostazioni iniziali
########################################
# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

########################################
### Configurazione di xmonad
########################################
if [ -d "$HOME/.xmonad" ]
then
   rm -r "$HOME/.xmonad"
fi

mkdir "$HOME/.xmonad"
ln -s "$scriptDir/xmonad/xmonad.hs" "$HOME/.xmonad/xmonad.hs"

########################################
### Configurazione di terminator
########################################
if [ ! -d "$HOME/.config" ]
then
   mkdir "$HOME/.config"
fi

ln -s "$scriptDir/terminator" "$HOME/.config/terminator"

########################################
### Configurazione dei font
########################################
if [ -d "$HOME/.fonts" ]
then
   rm -r "$HOME/.fonts"
fi

ln -s "$scriptDir/fonts" "$HOME/.fonts"
fc-cache -vf "$HOME/.fonts"
