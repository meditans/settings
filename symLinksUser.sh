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
chown "$user" "$HOME/.xmonad" 
ln -s "$scriptDir/xmonad/xmonad.hs" "$HOME/.xmonad/xmonad.hs"
