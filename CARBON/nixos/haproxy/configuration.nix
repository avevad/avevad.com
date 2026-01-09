{ config, lib, pkgs, ... }:

{
  services.haproxy = {
    enable = true;
    user = "root";
    group = "root";
    config = (builtins.replaceStrings
      [ "@CERT_FILE_PRO@" ]
      [ "${ ./avedus.pro.pem }" ]
      (builtins.readFile ./haproxy.cfg)
    );
  };
}
