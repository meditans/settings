#!/bin/sh

# Attenzione: Eseguire questo script come amministratore!

########################################
### Impostazioni iniziali
########################################
# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

# Troviamo la posizione dell'utente che invoca
homeDir=$(getent passwd $SUDO_USER | cut -d: -f6)

########################################
### Configurazione globale nixOS
########################################
rm -r /etc/nixos
ln -s "$scriptDir/nixos" /etc/nixos

########################################
### Configurazione di xmonad
########################################
if [ -d "$homeDir/.xmonad" ]
then
   rm -r "$homeDir/.xmonad"
fi

mkdir "$homeDir/.xmonad"
ln -s "$scriptDir/xmonad/xmonad.hs" "$homeDir/.xmonad/xmonad.hs"
