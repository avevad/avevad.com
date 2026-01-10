{ config, lib, pkgs, ... }:

let
  ENV = (import ../environment.nix) { pkgs = pkgs; };
in

{
  services.haproxy = {
    enable = true;
    config = (builtins.replaceStrings
      [
        "@CERT_FILE_PUSHY@"
        "@CERT_FILE_PRO@"
        "@DEPLOY_TOKEN@"
      ]
      [
        "${./haproxy_pushy.pem}"
        "${./haproxy_pro.pem}"
        ENV.TOKENS.HAPROXY_DEPLOY
      ]
      (builtins.readFile ./haproxy.cfg)
    );
  };
}
