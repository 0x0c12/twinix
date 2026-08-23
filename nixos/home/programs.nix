{ configs, pkgs, ...}:

{
	home.packages = with pkgs; [
	    home-manager
	    eww
            nemo 
	];
}
