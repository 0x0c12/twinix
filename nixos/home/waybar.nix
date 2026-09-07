{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;

        margin-top = 8;
        margin-left = 10;
        margin-right = 10;

        spacing = 6;

        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];

        modules-center = [
          "sway/window"
        ];

        modules-right = [
          "custom/media"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "pulseaudio"
          "network"
          "battery"
          "clock"
          "tray"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

          format = "{icon}";

          format-icons = {
            "1" = "𝔄";
            "2" = "𝔅";
            "3" = "ℭ";
            "4" = "𝔇";
            "5" = "𝔈";
            "6" = "𝔉";
            "7" = "𝔊";
            "8" = "𝕳";
            "9" = "ℑ";
          };
        };

        "sway/window" = {
          max-length = 50;
          separate-outputs = true;
        };

        # ─────────────────────────────────────────────
        # CPU
        # ─────────────────────────────────────────────

        cpu = {
          interval = 2;
          format = "󰻠 {usage}%";
          format-alt = "󰻠 {usage}% {avg_frequency}GHz";
          tooltip = true;

          tooltip-format = ''
            CPU Usage: {usage}%
            Load: {load}
            Frequency: {frequency} MHz
          '';
        };

        # ─────────────────────────────────────────────
        # MEMORY
        # ─────────────────────────────────────────────

        memory = {
          interval = 2;
          format = "󰍛 {percentage}%";
          tooltip-format = ''
            RAM: {used:0.1f}G / {total:0.1f}G
            Usage: {percentage}%
          '';
        };

        # ─────────────────────────────────────────────
        # CPU TEMPERATURE
        # ─────────────────────────────────────────────

        temperature = {
          interval = 2;
          format = "󰔏 {temperatureC}°C";
          critical-threshold = 85;
          warning-threshold = 70;

          tooltip-format = "CPU Temperature: {temperatureC}°C";
        };

        # ─────────────────────────────────────────────
        # MEDIA
        # ─────────────────────────────────────────────

        "custom/media" = {
          interval = 2;

          exec = "${pkgs.playerctl}/bin/playerctl metadata \
            --format '{{ artist }} 󰋀 {{ title }}' 2>/dev/null || true";

          exec-if = "${pkgs.playerctl}/bin/playerctl status 2>/dev/null";

          format = "󰝚 {}";
          max-length = 35;

          tooltip = true;
          tooltip-format = "Now Playing: {}";

          on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
          on-scroll-up = "${pkgs.playerctl}/bin/playerctl next";
          on-scroll-down = "${pkgs.playerctl}/bin/playerctl previous";
        };

        # ─────────────────────────────────────────────
        # CLOCK
        # ─────────────────────────────────────────────

        clock = {
          format = "󰥔  {:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y}";
        };

        # ─────────────────────────────────────────────
        # BATTERY
        # ─────────────────────────────────────────────

        battery = {
          format = "{icon} {capacity}%";

          format-icons = [
            "󰂎"
            "󰁺"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        # ─────────────────────────────────────────────
        # NETWORK
        # ─────────────────────────────────────────────

        network = {
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
        };

        # ─────────────────────────────────────────────
        # AUDIO
        # ─────────────────────────────────────────────

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 muted";

          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
        };

        tray = {
          spacing = 8;
        };

        backlight = {
          format = "󰃠 {percent}%";
          tooltip = true;
          tooltip-format = "Brightness: {percent}%";
        };
      };
    };

    style = ''
      @define-color bg #0D0D0D;
      @define-color bg-deep #080A0A;
      @define-color surface #12201E;
      @define-color surface2 #24403D;

      @define-color cyan #05F2DB;
      @define-color green #437320;
      @define-color green-bright #5A9828;

      @define-color text #CEE4F2;
      @define-color muted #8FA9B2;

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        font-weight: 600;

        border: none;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: @text;
      }

      #waybar > box {
        background: alpha(@bg, 0.90);
        border: 1px solid alpha(@cyan, 0.18);
        border-radius: 14px;

        padding: 3px 7px;
      }

      #workspaces {
        padding: 0 2px;
      }

      #workspaces button {
        color: @muted;
        background: transparent;

        border-radius: 10px;

        padding: 2px 9px;
        margin: 0 2px;

        transition:
          color 180ms ease,
          background 180ms ease;
      }

      #workspaces button:hover {
        color: @text;
        background: alpha(@surface2, 0.65);
      }

      #workspaces button.focused {
        color: @bg;
        background: @cyan;

        box-shadow: 0 0 12px alpha(@cyan, 0.25);
      }

      #workspaces button.urgent {
        color: @text;
        background: @green;
      }

      #window {
        color: @text;
        padding: 0 16px;
      }

      #clock,
      #battery,
      #network,
      #pulseaudio,
      #tray,
      #cpu,
      #memory,
      #temperature,
      #backlight,
      #custom-media {
        background: alpha(@surface, 0.8);

        border-radius: 9px;

        padding: 4px 10px;
        margin: 0 2px;
      }

      /* ───────────────────────────────────────────
         SYSTEM MONITORING
         ─────────────────────────────────────────── */

      #cpu {
        color: @cyan;
      }

      #memory {
        color: @text;
      }

      #temperature {
        color: @text;
      }

      #temperature.warning {
        color: @green-bright;
      }

      #temperature.critical {
        color: @cyan;
      }

      #backlight {
        color: @cyan;
      }

      /* ───────────────────────────────────────────
         MEDIA
         ─────────────────────────────────────────── */

      #custom-media {
        color: @text;
        padding-left: 12px;
        padding-right: 12px;
      }

      #custom-media:hover {
        color: @cyan;
        background: alpha(@surface2, 0.75);
      }

      /* ───────────────────────────────────────────
         OTHER MODULES
         ─────────────────────────────────────────── */

      #clock {
        color: @cyan;
      }

      #battery {
        color: @text;
      }

      #battery.warning {
        color: @green-bright;
      }

      #battery.critical {
        color: @cyan;
      }

      #network {
        color: @text;
      }

      #pulseaudio {
        color: @cyan;
      }

      tooltip {
        background: @bg-deep;
        border: 1px solid alpha(@cyan, 0.25);
        border-radius: 10px;
      }

      tooltip label {
        color: @text;
        padding: 6px;
      }
    '';
  };

  # playerctl is used by the media module.
  home.packages = with pkgs; [
    playerctl
    gawk
  ];
}
