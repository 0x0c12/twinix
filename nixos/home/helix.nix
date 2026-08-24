{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.clang-tools
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "hex_lavender_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    # FIXED: Properly structured language configuration
    languages = {
      language = [
        {
          name = "c";
          language-servers = [ "clangd" ];
        }
        {
          name = "cpp";
          language-servers = [ "clangd" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
        }
      ];
    };

    themes = {
      hex_lavender_transparent = {
        "inherits" = "hex_lavender";
        "ui.background" = {
          fg = "default";
        };
        "ui.cursor" = {
          modifiers = [ "reversed" ];
        };
      };
    };
  };
}
