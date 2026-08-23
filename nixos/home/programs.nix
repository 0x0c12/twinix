{ configs, pkgs, ...}:

{
	home.packages = with pkgs; [
	    # system stuff
	    eww
            nemo 
	    
	    # drawing & stuff
	    krita
	    xournalpp

	    # games
	    osu-lazer-bin
	];
}
