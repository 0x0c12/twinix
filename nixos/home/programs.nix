{ configs, pkgs, ...}:

{
	home.packages = with pkgs; [
	    eww
            nemo 
	];
}
