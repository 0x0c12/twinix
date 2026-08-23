{ config, pkgs, ... }:

{
  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  imports = [
    ./programs.nix
    ./sway.nix
    ./kitty.nix
    ./fonts.nix
  ];

  home.packages = [
    pkgs.home-manager
  ];
}

