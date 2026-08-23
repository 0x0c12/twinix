{config, pkgs, ...}:

{
  home.username = "twilight";
  home.homeDirectory = "/home/twilight";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    htop
    neofetch
    kitty
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
    modifier = "Mod4";
    terminal = "kitty";

    keybindings = let
      mod = modifier;
      in {
        "${mod}+Return" = "exec ${terminal}";
        "${mod}+Shift+q" = "kill";
        "${mod}+space" = "wofi --show run";
        "${mod}+l" = "swaylock";
       };
      };
    };
  programs.kitty.enable = true;
  programs.git.enable = true;

  programs.home-manager.enable = true;
}
