{ config, pkgs, ... }:

{
  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.bash.enable = true;

  imports = [
    ./aliases.nix
    ./programs.nix
    ./sway.nix
    ./kitty.nix
    ./fonts.nix
    ./git.nix
    ./gtk.nix
    ./qt.nix
  ];
}

