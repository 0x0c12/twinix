{ config, pkgs, ...}:

{
	dconf.enable = true;

	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};

		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme = 1;
		};

		gtk4.extraConfig = {
			gtk-application-prefer-dark-theme = 1;
		};
	};
}
