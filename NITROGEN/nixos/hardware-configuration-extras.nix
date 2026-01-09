{ config, lib, pkgs, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda"; 
    };
    timeout = 5;
  };
  boot.kernelParams = [];
}

