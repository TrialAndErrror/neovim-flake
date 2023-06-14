{
  config,
  lib,
  pkgs,
  ...
}: {imports = [./which-key.nix ./bindings.nix];}
