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
    ./vesktop.nix
  ];

  home.username = "twilight";
  home.homeDirectory = "/home/twilight";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.bash.enable = true;

  # I can't say fuck proprietary anymore :pensive:
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
}
