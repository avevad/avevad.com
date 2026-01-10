{ config, lib, pkgs, ... }:

let
  ENV = (import ../environment.nix) { pkgs = pkgs; };
in

{
  services.haproxy = {
    enable = true;
    config = (builtins.replaceStrings
        [ "@DEPLOY_TOKEN@" ] [ ENV.TOKENS.HAPROXY_DEPLOY ]
        (builtins.readFile ./haproxy.cfg)
    );
  };
}
