{ configs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # sway can kill itself
    swaybg
    swayidle
    wl-clipboard
    mako
    alacritty
    wofi
    waybar
    slurp

    # system stuff
    eww
    nemo
    nautilus
    fastfetch

    # editors
    helix

    # A/V
    ffmpeg
    mpv
    feh
    yt-dlp

    # drawing & stuff
    krita
    xournalpp
    zbar

    # games
    osu-lazer-bin
    vesktop

    # remote access
    parsec-bin

    # networking shit
    nmap
    aircrack-ng
    btop
  ];
}
