{ configs, pkgs, ...}:

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

	    # system stuff
	    eww
      nemo 
	    nautilus

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

	    # games
	    osu-lazer-bin    
	];
}
