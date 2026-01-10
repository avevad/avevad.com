{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "uhci_hcd" "virtio_pci" "virtio_blk" "virtio_scsi" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelParams = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
    };
    timeout = 5;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/09494c87-b57b-40c2-8b74-ee21161843c9";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/47c73891-efb7-46e0-9f2a-779750c8ae7b";
    fsType = "ext4";
  };

  fileSystems."/mnt/state" = {
   device = "/dev/disk/by-uuid/60739e05-7d2e-491a-aefe-46a45c8cb628";
   fsType = "ext4";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
