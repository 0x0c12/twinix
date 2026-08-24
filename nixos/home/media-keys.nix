{ pkgs, ... }:

let
  eww = "${pkgs.eww}/bin/eww";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  awk = "${pkgs.gawk}/bin/awk";
  sleep = "${pkgs.coreutils}/bin/sleep";
  mkdir = "${pkgs.coreutils}/bin/mkdir";
  rm = "${pkgs.coreutils}/bin/rm";
  cat = "${pkgs.coreutils}/bin/cat";
  kill = "${pkgs.coreutils}/bin/kill";

  osdTimeout = "$HOME/.cache/eww-osd.pid";

  showOsd = pkgs.writeShellScript "show-osd" ''
    ${mkdir} -p "$HOME/.cache"

    # Kill the previous hide timer, if there is one.
    if [ -f "${osdTimeout}" ]; then
      old_pid="$(${cat} "${osdTimeout}" 2>/dev/null || true)"

      if [ -n "$old_pid" ]; then
        ${kill} "$old_pid" 2>/dev/null || true
      fi

      ${rm} -f "${osdTimeout}"
    fi

    ${eww} update osd_visible=true
    ${eww} open osd

    (
      ${sleep} 1.5
      ${eww} update osd_visible=false
    ) &

    echo $! > "${osdTimeout}"
  '';

  volumeUp = pkgs.writeShellScript "volume-up" ''
    ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+

    volume="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        ${awk} '{ printf "%d", $2 * 100 }'
    )"

    muted="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        grep -q MUTED &&
        echo true ||
        echo false
    )"

    ${eww} update osd_type=volume
    ${eww} update osd_value="$volume"
    ${eww} update osd_muted="$muted"

    ${showOsd}
  '';

  volumeDown = pkgs.writeShellScript "volume-down" ''
    ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-

    volume="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        ${awk} '{ printf "%d", $2 * 100 }'
    )"

    muted="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        grep -q MUTED &&
        echo true ||
        echo false
    )"

    ${eww} update osd_type=volume
    ${eww} update osd_value="$volume"
    ${eww} update osd_muted="$muted"

    ${showOsd}
  '';

  volumeMute = pkgs.writeShellScript "volume-mute" ''
    ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle

    volume="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        ${awk} '{ printf "%d", $2 * 100 }'
    )"

    muted="$(
      ${wpctl} get-volume @DEFAULT_AUDIO_SINK@ |
        grep -q MUTED &&
        echo true ||
        echo false
    )"

    ${eww} update osd_type=volume
    ${eww} update osd_value="$volume"
    ${eww} update osd_muted="$muted"

    ${showOsd}
  '';

  brightnessUp = pkgs.writeShellScript "brightness-up" ''
    ${brightnessctl} set 5%+

    percentage="$(
      ${brightnessctl} -m |
        ${awk} -F, '{ gsub("%", "", $4); print int($4) }'
    )"

    ${eww} update osd_type=brightness
    ${eww} update osd_value="$percentage"
    ${showOsd}
  '';

  brightnessDown = pkgs.writeShellScript "brightness-down" ''
    ${brightnessctl} set 5%-

    percentage="$(
      ${brightnessctl} -m |
        ${awk} -F, '{ gsub("%", "", $4); print int($4) }'
    )"

    ${eww} update osd_type=brightness
    ${eww} update osd_value="$percentage"
    ${showOsd}
  '';

in
{
  home.packages = [
    pkgs.brightnessctl
    pkgs.wireplumber
    pkgs.gawk
  ];

  home.file.".local/bin/volume-up".source = volumeUp;
  home.file.".local/bin/volume-down".source = volumeDown;
  home.file.".local/bin/volume-mute".source = volumeMute;

  home.file.".local/bin/brightness-up".source = brightnessUp;
  home.file.".local/bin/brightness-down".source = brightnessDown;
}
