{
  config,
  pkgs,
  flakeRoot,
  ...
}:

{
  programs.vesktop = {
    enable = true;
  };

  xdg.configFile."vesktop/themes/ventcord.them.css".source =
    "${flakeRoot}/assets/vesktop/ventcord.them.css";
}
