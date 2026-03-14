{
  description = "Standalone RootApp package - Auto-Updated via GitHub Actions";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system} = rec {
        rootapp = pkgs.appimageTools.wrapType2 {
          pname = "rootapp";
          version = "latest";
          
          src = pkgs.fetchurl {
            url = "https://installer.rootapp.com/installer/Linux/X64/Root.AppImage";
            hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
          };

          extraInstallCommands = ''
            mkdir -p $out/share/icons/hicolor/256x256/apps
            cp ${./rootapp.png} $out/share/icons/hicolor/256x256/apps/rootapp.png

            mkdir -p $out/share/applications
            cat > $out/share/applications/rootapp.desktop <<EOF
            [Desktop Entry]
            Type=Application
            Name=RootApp
            Exec=rootapp
            Icon=rootapp
            Comment=Root Field Service Management
            Categories=Utility;
            Terminal=false
            EOF
          '';
        };

        default = rootapp;
      };
    };
}
