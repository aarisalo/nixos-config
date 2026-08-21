{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Akseli Arisalo";
        email = "arisalo.akseli@hotmail.fi";
      };
      init.defaultBranch = "main";
    };
  };
}