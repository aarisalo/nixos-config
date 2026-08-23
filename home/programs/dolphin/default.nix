{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qtsvg
    kdePackages.dolphin
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
  };

  xdg.configFile."kdeglobals".source = ../../config/kdeglobals;
}