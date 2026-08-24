{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;

		settings = {
			background_opacity = "0.45";
			dynamic_background_opacity = true;
		};

		font = {
			name = "JetBrainsMono Nerd Font";
			size = 14;
		};
  };
}
