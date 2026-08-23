{ config, pkgs, ... }:

{
  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./programs.nix
    ./sway.nix
    ./kitty.nix
    ./fonts.nix
    ./git.nix
  ];
}

