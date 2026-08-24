{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  _module.args = {
    inherit theme;
  };
  imports = [
    # helpers
    ./aliases.nix
    ./programs.nix
    ./fonts.nix
    ./media-keys.nix

    # configs
    ./git.nix
    ./gtk.nix
    ./qt.nix
    ./waybar.nix
    ./wofi.nix
    ./swaylock.nix
    ./mako.nix
    ./helix.nix
    ./sway.nix
    ./kitty.nix
  ];

  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.bash.enable = true;

}
