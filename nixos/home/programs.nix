{ configs, pkgs, ...}:

{
	home.packages = [
	    pkgs.home-manager
	    pkgs.eww
	];
}
