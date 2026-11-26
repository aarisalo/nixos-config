{ config, pkgs, ... }:

{
  # Steam's steam_dev.cfg lives in ~/.steam/steam/, which is a symlink to
  # ~/.local/share/Steam/. Do NOT manage "~/.steam/steam" itself as a file.
  # (`home-files` is an internal option in current home-manager; use `home.file`.)
  home.file."steam/steam/steam_dev.cfg".source = ../../config/steam_dev.cfg;
}
