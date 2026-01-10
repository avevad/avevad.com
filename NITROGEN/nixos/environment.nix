{ pkgs }:

{
  DEPLOY = {
    PUSHY_REV = builtins.readFile ./deployment/refs/pushy.txt;
    PUSHY_TEST_REV = builtins.readFile ./deployment/refs/pushy_test.txt;
    PUSHY_DOCS_REV = builtins.readFile ./deployment/refs/pushy_docs.txt;
  };

  TOKENS = import ./tokens.nix;
}
