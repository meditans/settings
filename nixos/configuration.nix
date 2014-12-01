{ config, lib, pkgs, ... }:

with lib;

{
  imports = [
    ./virtualbox.nix
    ./graphical.nix
  ];
  
  environment.systemPackages = with pkgs; [
    firefoxWrapper conkerorWrapper
    zathura gpicview
    wget curl
    terminator zsh
    unrar unzip
    gitAndTools.gitFull
    dejavu_fonts

    emacs

    #(pkgs.texLiveAggregationFun {paths = [ pkgs.texLive
    #                                       pkgs.texLiveExtra
    #                                       pkgs.texLiveBeamer
    #                                       pkgs.texLiveCMSuper
    #                                     ];})

    python
    
    xlibs.xmessage
  ];
  
  users.mutableUsers = false;

  users.extraUsers.carlo =
    { createHome = true;
      home = "/home/carlo";
      description = "Carlo Nucera";
      # il gruppo wheel mi serve per entrare nei sudoers
      # il gruppo vboxsf mi serve per montare le cartelle condivise 
      extraGroups = [ "wheel" "vboxsf" ];
      useDefaultShell = true;
      password = "carlo";
      uid = 1001;
    };

  networking.firewall.allowPing = true;

  nixpkgs.config.allowUnfree = true;
  nix.trustedBinaryCaches = [ "http://hydra.nixos.org" ];
}
