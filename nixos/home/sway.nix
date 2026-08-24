{ config, pkgs, flakeRoot, ... }:

{
	home.file.".local/share/wallpapers/venti_dark.jpg".source = 
		"${flakeRoot}/assets/venti_dark.jpg";

	wayland.windowManager.sway = {
	    enable = true;
	    package = pkgs.swayfx;
	    checkConfig = false;

	    extraConfig = ''
				corner_radius 12

				blur enable
				blur_radius 4
				blur_passes 2
				blur_xray disable

				shadows enable
				shadow_blur_radius 12
				shadow_offset 0 3
				shadow_color #00000000

				animation_duration_ms 200
	    '';

	    config = {
	      modifier = "Mod4";
	      terminal = "kitty";

	      bars = [ ];

	      startup = [
	      	{
	      		command = "waybar";
	      		always = true;
	      	}
	      ];

	    	window = {
	    		border = 2;
	    		titlebar = false;
	    	};

				colors = {
				  focused = {
				    border = "#05F2DB";
				    background = "#0D0D0D";
				    text = "#CEE4F2";
				    indicator = "#05F2DB";
				    childBorder = "#05F2DB";
				  };
				
				  focusedInactive = {
				    border = "#437320";
				    background = "#24403D";
				    text = "#CEE4F2";
				    indicator = "#437320";
				    childBorder = "#437320";
				  };
				
				  unfocused = {
				    border = "#24403D";
				    background = "#0D0D0D";
				    text = "#CEE4F2";
				    indicator = "#24403D";
				    childBorder = "#24403D";
				  };
				
				  urgent = {
				    border = "#437320";
				    background = "#437320";
				    text = "#CEE4F2";
				    indicator = "#437320";
				    childBorder = "#437320";
				  };
				};
				
	      gaps = {
	      	inner = 12;
	      	outer = 8;
	      };

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

	      	"${mod}+h" = "focus left";
	      	"${mod}+j" = "focus down";
	      	"${mod}+k" = "focus up";
	      	"${mod}+l" = "focus right";

	      	"${mod}+Shift+h" = "resize shrink width 50 px";
	      	"${mod}+Shift+l" = "resize grow width 50 px";
	      	"${mod}+Shift+k" = "resize shrink height 50 px";
	      	"${mod}+Shift+j" = "resize grow height 50 px";

	      	"${mod}+Shift+space" = "floating toggle";

	      	"${mod}+r" = "mode resize";

	      	"${mod}+Return" = "exec kitty";
	      	"${mod}+q" = "kill";
	      	"${mod}+space" = "exec wofi --show drun";
	      	"${mod}+Shift+q" = "exec swaylock";
	      	"${mod}+Shift+e" = "exec swaymsg exit";
	      	"${mod}+b" = "exec firefox";
	      	# "${mod}+e" = "exec nemo";
	      	"${mod}+e" = "exec nautilus";
	      	"${mod}+Shift+s" = "exec grim - | wl-copy";

	      	# fn stuff
	    		"XF86AudioMute" = "exec ~/.local/bin/volume-mute";
      		"XF86AudioLowerVolume" = "exec ~/.local/bin/volume-down";
      		"XF86AudioRaiseVolume" = "exec ~/.local/bin/volume-up";

      		"XF86MonBrightnessDown" = "exec ~/.local/bin/brightness-down";
      		"XF86MonBrightnessUp" = "exec ~/.local/bin/brightness-up";
	      };

	    	modes = {
	    		resize = {
	    	  	"h" = "resize shrink width 50 px";
	    	  	"l" = "resize grow width 50 px";
	    	  	"k" = "resize shrink height 50 px";
	    	  	"j" = "resize grow height 50 px";
	    	  	"Mod4+Return" = "mode default";
	    		};
	    	};
	    };
	  };
}
