{ config, pkgs, ... }:

{
  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";

      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+Return" = "exec kitty";
        "${mod}+Shift+q" = "kill";
        "${mod}+space" = "wofi --show run";
        "${mod}+l" = "swaylock";
      };
    };
  };
  
  programs.kitty.enable = true;
}

