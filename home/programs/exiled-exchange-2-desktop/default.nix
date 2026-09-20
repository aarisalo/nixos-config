{ pkgs, ... }:

let
  icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Kvan7/Exiled-Exchange-2/master/main/build/icons/icon.png";
    hash = "sha256:df4197b24230390e26d5ae9d726ecc5d5c251ec62f43e4a76af1064ca1ea1d4a";
  };
in
{
  xdg.desktopEntries."exiled-exchange-2" = {
    name = "Exiled Exchange 2";
    comment = "PoE 2 price checker and trade helper";
    exec = "env XDG_SESSION_TYPE=x11 exiled-exchange-2 --ozone-platform=x11 --disable-gpu-sandbox --no-overlay";
    icon = "${icon}";
    categories = [ "Utility" "Game" ];
    terminal = false;
  };
}