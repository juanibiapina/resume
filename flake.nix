{
  description = "My personal curriculum vitae";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    altacv = {
      type = "github";
      owner = "liantze";
      repo = "AltaCV";
      flake = false;
    };
  };

  outputs = { nixpkgs, altacv, ... }:
    let
      system = "x86_64-linux";
      resumeFile = "resume";
    in {
      packages.${system}.default = with import nixpkgs { inherit system; };
        stdenv.mkDerivation {
          name = resumeFile;

          src = ./.;

          nativeBuildInputs = [
            texliveFull
          ];

          buildPhase = ''
            cp  ${altacv}/*.cls ${altacv}/*.cfg .

            # lualatex needs writable HOME to store tmp files
            export HOME=$(mktemp -d)
            echo $HOME
            lualatex src/${resumeFile}.tex
          '';

          installPhase = ''
            mkdir $out
            cp ${resumeFile}.pdf $out/${resumeFile}.pdf
          '';
        };
    };
}
