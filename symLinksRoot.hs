#!/bin/sh

# Attenzione: Eseguire questo script come amministratore!

########################################
### Impostazioni iniziali
########################################
# Troviamo la posizione dello script
scriptDir=$( cd "$( dirname "$0" )" && pwd )

# Troviamo la posizione dell'utente che invoca
# homeDir=$(getent passwd $SUDO_USER | cut -d: -f6)

# Il nick dell'utente che sta invocando lo script
# user=$SUDO_USER

########################################
### Configurazione globale nixOS
########################################
rm -r /etc/nixos
ln -s "$scriptDir/nixos" /etc/nixos
