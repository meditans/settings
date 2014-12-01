{ config, lib, pkgs, ... }:

with lib;

{
  fileSystems."/".device = "/dev/disk/by-label/nixos";

  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  services.virtualbox.enable = true;

  # Add some more video drivers to give X11 a shot at working in VMware and QEMU.
  services.xserver.videoDrivers = mkOverride 40 [ "virtualbox" "vmware" "cirrus" "vesa" ];

  # Prevent logging in as root without a password. For the demo
  # images, there is a demo user account that can sudo to root. Che io pero' ho tolto!
  security.initialRootPassword = mkDefault "!";
}
