{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = { };
      init.defaultBranch = "main";
    };
  };

  services.ssh-agent.enable = true;
}
