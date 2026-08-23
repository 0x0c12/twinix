{ config, pkgs, flakeRoot, ... }:

{
	home.file.".local/share/wallpapers/venti_dark.jpg".source = 
		"${flakeRoot}/assets/venti_dark.jpg";

	wayland.windowManager.sway = {
	    enable = true;
	    checkConfig = false;

	    config = {
	      modifier = "Mod4";
	      terminal = "kitty";

	      output = {
	      	"eDP-1" = {
	      		bg = "${config.home.homeDirectory}/.local/share/wallpapers/venti_dark.jpg fill";
	      	};
	      };
	
	    # KEYBINDINGS
	      keybindings = let
				mod = "Mod4";
				workspaceBindings = builtins.listToAttrs (map (n: {
					name = "${mod}+${toString n}";
					value = "workspace number ${toString n}";
				}) (builtins.genList (n: n + 1) 9));
				workspaceShiftBindings = builtins.listToAttrs (map (n: {
					name = "${mod}+Shift+${toString n}";
					value = "move container to workspace number ${toString n}";
				}) (builtins.genList (n: n + 1) 9));
	      in
	      workspaceBindings // workspaceShiftBindings // {
	      	"${mod}+Return" = "exec kitty";
	      	"${mod}+q" = "kill";
	      	"${mod}+space" = "exec wofi --show drun";
	      	"${mod}+l" = "exec swaylock";
	      	"${mod}+b" = "exec firefox";
	      	# "${mod}+e" = "exec nemo";
	      	"${mod}+e" = "exec nautilus";
	      };
	    };
	  };
}
