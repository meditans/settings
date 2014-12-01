#!/bin/sh

# Questo script va eseguito da root (con sudo -i)

###################### Script ########################

# Questo mi porta alla versione piu' moderna del database
nix-channel --add http://nixos.org/channels/nixos-unstable nixos
nix-channel --update nixos

# E ora via con la build
nixos-rebuild switch
