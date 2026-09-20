{ pkgs, ...}:

let
  version = "0.16.3";
  pname = "exiled-exchange-2";

  src = pkgs.fetchurl {
    url = "https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${version}/Exiled-Exchange-2-${version}.AppImage";
    hash = "sha256:6801c510b7652fb71c729cc05bd44e1c5d616430274064cb2ed0e89d2d024f64";
  };

  exiled-exchange-2 = pkgs.appimageTools.wrapType2 rec {
    inherit pname version src;

    meta = {
      description = "PoE 2 price checker and trade helper";
      homepage = "https://github.com/Kvan7/Exiled-Exchange-2";
      downloadPage = "https://github.com/Kvan7/Exiled-Exchange-2/releases";
      platforms = [ "x86_64-linux" ];
      mainProgram = pname;
    };
  };
in  

{
  environment.systemPackages = [exiled-exchange-2];
}