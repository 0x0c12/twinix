{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      font = "JetBrainsMono Nerd Font 11";

      background-color = "#0D0D0DE6";
      text-color = "#CEE4F2";

      border-color = "#05F2DB2E";
      border-size = 1;
      border-radius = 10;

      padding = "10";
      margin = "10";

      width = 360;
      height = 120;

      icons = true;
      max-icon-size = 48;

      default-timeout = 5000;

      max-visible = 5;

      anchor = "top-right";

      layer = "overlay";

      progress-color = "#05F2DB";

      markup = true;
    };
  };
}
