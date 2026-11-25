{ pkgs, ... }:

{
  # Electron's "move to system trash" shells out to `gio trash` on PATH
  # (shell/common/platform_util_linux.cc); without it, deleting a note
  # fails instead of moving to the trash bin.
  home.packages = [ pkgs.glib ];

  programs.obsidian = {
    enable = true;

    vaults.notes.target = "Documents/Obsidian";

    defaultSettings.app = {
      alwaysUpdateLinks = true;
      spellcheck = true;
    };
  };
}