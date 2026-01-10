{ config, lib, pkgs, ... }:

let
  ENV = (import ../environment.nix) { pkgs = pkgs; };
in

{
  services.haproxy = {
    enable = true;
    config = (builtins.replaceStrings
      [
        "@CERT_FILE@"
        "@CERT_FILE_PUSHY@"
        "@CERT_FILE_TONSBP@"
        "@CERT_FILE_PRO@"
        "@DEPLOY_TOKEN@"
      ]
      [
        "${ pkgs.writeText "haproxy.pem" ENV.HAPROXY_CERT }"
        "${ pkgs.writeText "haproxy.pem" ENV.HAPROXY_CERT_PUSHY }"
        "${ pkgs.writeText "haproxy.pem" ENV.HAPROXY_CERT_TONSBP }"
        "${ pkgs.writeText "haproxy.pem" ENV.HAPROXY_CERT_PRO }"
        ENV.TOKENS.HAPROXY_DEPLOY
      ]
      (builtins.readFile ./haproxy.cfg)
    );
  };
}

