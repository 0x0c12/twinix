{ config, pkgs, theme, flakeRoot, ... }:

{
	home.file.".local/share/wallpapers/venti_lockscreen.jpg".source = 
		"${flakeRoot}/assets/lockscreen.jpg";

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      image = "${config.home.homeDirectory}/.local/share/wallpapers/venti_lockscreen.jpg";
      scaling = "fill";

      effect-vignette = "0.5:0.5";
      
      color = theme.colors.bg;

      font = "JetBrainsMono Nerd Font";
      font-size = 22;

      indicator-radius = 100;
      indicator-thickness = 8;

      ring-color = theme.colors.surfaceAlt;
      line-color = theme.colors.cyan;

      inside-color = theme.colors.bg;

      key-hl-color = theme.colors.cyan;
      bs-hl-color = theme.colors.green;

      separator-color = theme.colors.surfaceAlt;

      text-color = theme.colors.text;
      text-clear-color = theme.colors.text;
      text-caps-lock-color = theme.colors.cyan;
      text-ver-color = theme.colors.textMuted;
      text-wrong-color = theme.colors.green;

      show-failed-attempts = true;
      indicator-idle-visible = false;
    };
  };
}
