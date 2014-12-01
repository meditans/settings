# This module defines a NixOS configuration that contains X11 and
# KDE 4.  It's used by the graphical installation CD.

{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.xmonad.enable = true;
    windowManager.xmonad.enableContribAndExtras = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    displayManager = {
      slim = {
        enable = true;
        defaultUser = "carlo";
      };
    };
    wacom.enable = true;
  };

  environment.systemPackages = [ pkgs.glxinfo ];
}
