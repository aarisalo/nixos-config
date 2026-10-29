# Hyperline — Deadlock mod manager / tray launcher (https://hyperline.gg)
#
# The vendor ships a `hyperline` binary plus install.sh. The binary is a
# *self-updating* signed binary that overwrites itself in place, so Nix must
# only seed it once (Nix-managed store paths are read-only and would break the
# updater). Because it is not a Nix derivation, its dynamic deps are not wired
# up, so the launcher is a thin wrapper that adds the missing libraries to
# LD_LIBRARY_PATH and execs the self-updating target.
let
  # Path where the vendor places the binary: ${XDG_DATA_HOME}/hyperline.
  # XDG_DATA_HOME is not overridden in this repo, so it resolves to the default.
  xdgDataDir = "/home/akseli/.local/share";
  targetBin = "${xdgDataDir}/hyperline/hyperline";

  # One-time download location the user dropped the archive in. Only used as a
  # seed; gitignored (200MB) and superseded by the app's self-updates.
  seed = "/home/akseli/.dotfiles/home/programs/hyperline-deadlock/hyperline-linux-amd64/hyperline";
in
{ lib, pkgs, ... }:
let
  # Libraries the vendor binary needs that the desktop session doesn't provide.
  extraLibs = with pkgs; [ libglvnd wayland libxcursor ];
  libPath = lib.concatMapStringsSep ":" (p: "${p}/lib") extraLibs;

  # Execs the self-updating target so in-place app updates keep working.
  launcher = pkgs.writeShellScriptBin "hyperline" ''
    export LD_LIBRARY_PATH="${libPath}:"''${LD_LIBRARY_PATH:-}
    exec "${targetBin}" "$@"
  '';
in
{
  xdg.desktopEntries."hyperline" = {
    name = "Hyperline";
    comment = "Play custom Deadlock games with friends";
    exec = "${launcher}/bin/hyperline %u";
    icon = "applications-games";
    terminal = false;
    categories = [ "Game" ];
    mimeType = [ "x-scheme-handler/hyperline" ];
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Open hyperline:// links (from the website) in Hyperline.
      "x-scheme-handler/hyperline" = [ "hyperline.desktop" ];
    };
  };

  # Seed the binary once. Guarded by [ ! -e target ] so later activations
  # (and the app's own in-place self-updates) are never clobbered.
  home.activation.hyperline = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    data_dir="${xdgDataDir}"
    target="$data_dir/hyperline/hyperline"
    if [ ! -e "$target" ]; then
      if [ -r "${seed}" ]; then
        mkdir -p "$data_dir/hyperline"
        install -m 755 "${seed}" "$target"
        echo "Seeded Hyperline binary to $target"
      else
        echo "Hyperline: seed not found at ${seed}"
        echo "  Download it (signed in at hyperline.gg/download/linux), extract,"
        echo "  place the 'hyperline' binary in that folder, then re-run home-manager activate."
      fi
    fi
  '';
}
