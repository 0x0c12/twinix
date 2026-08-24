{ config, pkgs, theme, ... }:

{
  home.file.".config/wofi/style.css".text = ''
    window {
      background-color: ${theme.colors.bg};
      border: 1px solid ${theme.colors.cyan};
      border-radius: 14px;
    }

    #input {
      margin: 12px;
      padding: 10px 14px;

      color: ${theme.colors.text};
      background-color: ${theme.colors.surface};

      border: 1px solid ${theme.colors.surfaceAlt};
      border-radius: 10px;
    }

    #input:focus {
      border-color: ${theme.colors.cyan};
    }

    #outer-box {
      padding: 8px;
    }

    #inner-box {
      padding: 4px;
    }

    #entry {
      padding: 9px 12px;
      margin: 2px;

      border-radius: 9px;

      color: ${theme.colors.text};
    }

    #entry:hover {
      background-color: ${theme.colors.surfaceAlt};
    }

    #entry:selected {
      color: ${theme.colors.bg};
      background-color: ${theme.colors.cyan};
    }

    #text {
      margin-left: 8px;
    }

    #entry:selected #text {
      color: ${theme.colors.bg};
    }
  '';
}
