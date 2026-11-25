{ pkgs, ... }:

let
  # GodotSteam v3.27 (Godot 3.6, Steamworks 1.60) pre-compiled Linux 64-bit
  # bundle. The "editor" file is a full Godot 3.6 editor with the steam
  # module baked in; it needs libsteam_api.so resolvable at runtime.
  # Runtime deps the pre-built binary needs that the store path's rpath
  # can't cover.
  runtimeLibs = with pkgs; [ libxcursor libxinerama libxrender libxi libxext libxrandr libx11 libGL ];

  godotsteam = pkgs.stdenvNoCC.mkDerivation {
    pname = "godotsteam-editor";
    version = "3.27";
    src = pkgs.fetchurl {
      url = "https://codeberg.org/godotsteam/godotsteam/releases/download/v3.27/linux64-g36-s160-gs327.zip";
      sha256 = "7c8eb741b4faad3b063801cbd1b80f3f38223e3e93f67e04f60bb6f8213895c1";
    };
    templates = pkgs.fetchurl {
      url = "https://codeberg.org/godotsteam/godotsteam/releases/download/v3.27/godotsteam-g36-s160-gs327-templates.zip";
      sha256 = "3008476f4e48c665a7c042713c21cdeb496818b3698c4e869ab1a64713f9c172";
    };
    nativeBuildInputs = [ pkgs.unzip pkgs.patchelf ];
    # Both zips unpack flat (no top-level directory), which the default
    # unpackPhase check rejects.
    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;
    installPhase = ''
      unzip -oq $src -d src
      unzip -oq $templates -d templates

      install -Dm755 src/godotsteam.36.editor.linux.64 $out/bin/godotsteam3.6
      install -Dm755 src/libsteam_api.so $out/lib/libsteam_api.so
      # The binary's PT_INTERP is /lib64/ld-linux-x86-64.so.2, which on
      # NixOS is a stub; point it at the glibc loader and add the X/GL
      # runtime deps to the rpath.
      patchelf --set-interpreter ${pkgs.glibc}/lib64/ld-linux-x86-64.so.2 $out/bin/godotsteam3.6
      patchelf --set-rpath "${pkgs.lib.makeLibraryPath runtimeLibs}:$out/lib" $out/bin/godotsteam3.6

      # Linux export templates; point the export preset's custom template
      # fields at these.
      mkdir -p $out/share/godotsteam/templates
      install -Dm755 templates/godotsteam.36.template.linux.64 \
        $out/share/godotsteam/templates/
      install -Dm755 templates/godotsteam.36.debug.template.linux.64 \
        $out/share/godotsteam/templates/
      install -Dm644 templates/libsteam_api.so \
        $out/share/godotsteam/templates/
    '';
  };
in
{
  home.packages = [ godotsteam ];

  xdg.desktopEntries."godotsteam3.6" = {
    name = "GodotSteam (Godot 3.6)";
    comment = "Godot 3.6 editor with GodotSteam";
    exec = "godotsteam3.6";
    icon = "applications-development";
    categories = [ "Development" "IDE" ];
    terminal = false;
  };
}
