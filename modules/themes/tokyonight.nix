{ pkgs, config, lib, ... }:
with lib;
with builtins;

let
  cfg = config.vim.theme.tokyonight;
in {

  options.vim.theme.tokyonight = {
    enable = mkEnableOption "Enable Tokyo Night Theme";
    
    style = mkOption {
      description = ''Theme style: "storm", darker variant "night", and "day"'';
      default = "storm";
      type = types.enum [ "day" "night" "storm" ];
    };
  };

  config = mkIf cfg.enable (
    let
      mkVimBool = val: if val then "1" else "0";
    in {
      vim.configRC = ''
        " need to set tokyonight style before colorscheme to apply
        let g:tokyonight_style = "${cfg.style}"
        colorscheme tokyonight
      '';

      vim.startPlugins = with pkgs.neovimPlugins; [tokyonight];
    }
  );
}
 