{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  _module.args = {
    inherit theme;
  };
  imports = [
    ./aliases.nix
    ./programs.nix
    ./sway.nix
    ./kitty.nix
    ./fonts.nix
    ./git.nix
    ./gtk.nix
    ./qt.nix
    ./waybar.nix
    ./wofi.nix
    ./swaylock.nix
    ./mako.nix
    ./media-keys.nix
  ];

  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.bash.enable = true;

}
