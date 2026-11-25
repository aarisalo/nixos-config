{ pkgs, ... }:

let
  # Godot RE Tools (gdsdecomp) pre-built Linux x86_64 release. It's a
  # Godot-based tool: the binary looks for its project .pck next to the
  # executable and loads the C# AOT library via its rpath, so all three
  # release files must end up together.
  version = "2.8.0-beta.2";
  pname = "gdre-tools";

  # Godot dlopen()s these at runtime, so they don't show up in ldd and
  # must be provided via the rpath.
  runtimeLibs = with pkgs; [
    # Wayland display server
    wayland libxkbcommon
    # Vulkan renderer + ICD driver
    vulkan-loader mesa
    # System font support
    fontconfig freetype expat libuuid zlib bzip2 libpng
    # X11 fallback display server
    libX11 libXcursor libXext libXi libXinerama libXrandr libXrender
    # Audio
    alsa-lib
  ];

  gdre-tools = pkgs.stdenvNoCC.mkDerivation {
    inherit pname version;

    src = pkgs.fetchurl {
      url = "https://github.com/GDRETools/gdsdecomp/releases/download/v${version}/GDRE_tools-v${version}-linux.zip";
      sha256 = "99f2d4b9f25f9f717ca51763a9cabc3e6454101906b5a3b9558c8c5aff706b0e";
    };

    nativeBuildInputs = [ pkgs.unzip pkgs.patchelf ];
    # Zip unpacks flat (no top-level directory), which the default
    # unpackPhase check rejects.
    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      unzip -oq $src -d src

      # Godot resolves the project pck by matching the executable name
      # (gdre-tools-bin -> gdre-tools-bin.pck), so keep that name and
      # the pck next to it.
      install -Dm755 src/gdre_tools.x86_64 $out/bin/gdre-tools-bin
      install -Dm644 src/gdre_tools.pck $out/bin/gdre-tools-bin.pck
      install -Dm644 src/libGodotMonoDecompNativeAOT.so $out/lib/libGodotMonoDecompNativeAOT.so

      # Godot dlopen()s libfontconfig and needs to be told where the
      # fontconfig config and the fonts live.
      cat > $out/bin/gdre-tools <<EOF
#!/bin/sh
export FONTCONFIG_FILE='${pkgs.lib.getOutput "out" pkgs.fontconfig}/etc/fonts/fonts.conf'
export FONTCONFIG_PATH='${pkgs.dejavu_fonts}/share/fonts'
exec "\$(dirname "\$(readlink -f "\$0")")/gdre-tools-bin" "\$@"
EOF
      chmod +x $out/bin/gdre-tools
    '';

    # Run after fixupPhase, which would otherwise reset the rpath.
    # PT_INTERP is /lib64/ld-linux-x86-64.so.2, which on NixOS is a
    # stub; point it at the glibc loader and add the AOT library plus
    # the runtime dlopen()ed dependencies.
    postFixup = ''
      patchelf --set-interpreter ${pkgs.glibc}/lib64/ld-linux-x86-64.so.2 $out/bin/gdre-tools-bin
      patchelf --set-rpath "${pkgs.lib.makeLibraryPath runtimeLibs}:$out/lib" $out/bin/gdre-tools-bin
    '';

    meta = {
      description = "Godot RE Tools - Godot project recovery and decompilation (GUI + headless CLI)";
      homepage = "https://github.com/GDRETools/gdsdecomp";
      downloadPage = "https://github.com/GDRETools/gdsdecomp/releases";
      platforms = [ "x86_64-linux" ];
      mainProgram = "gdre-tools";
      license = pkgs.lib.licenses.mit;
    };
  };
in
{
  home.packages = [ gdre-tools ];

  xdg.desktopEntries."gdre-tools" = {
    name = "Godot RE Tools";
    comment = "Godot project recovery and decompilation";
    exec = "gdre-tools";
    icon = "applications-development";
    categories = [ "Development" "Utility" ];
    terminal = false;
  };
}
