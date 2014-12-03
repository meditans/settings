#!/bin/sh

# Script che serve per configurare le mie impostazioni del browser
# conkeror. Il bello e' che posso symlinkare direttamente dentro la
# mia cartella il file .conkerorrc.

scriptDir=$( cd "$( dirname "$0" )" && pwd )

if [ -f "$HOME/.conkerorrc" ]
then
   rm "$HOME/.conkerorrc"
fi

ln -s "$scriptDir/conkeror/conkerorrc" "$HOME/.conkerorrc" 
