{ pkgs, ...}:

let
  version = "2.20";
  pname = "artix-games-launcher";

  src = pkgs.fetchurl {
    url = "https://launch.artix.com/latest/Artix_Games_Launcher-x86_64.AppImage";
    hash = "sha256:f1e5573a6e60f76c04ad66ba95b4d7ac22f4e0c59894e6e3a271c993ea142371";
  };

  artix-games-launcher = pkgs.appimageTools.wrapType2 rec {
    inherit pname version src;

    meta = {
      description = "Launcher for Artix Games";
      homepage = "https://www.artix.com/";
      downloadPage = "https://launch.artix.com/latest/Artix_Games_Launcher-x86_64.AppImage";
      platforms = [ "x86_64-linux" ];
      mainProgram = pname;
    };
  };
in  

{
  environment.systemPackages = [artix-games-launcher];
}