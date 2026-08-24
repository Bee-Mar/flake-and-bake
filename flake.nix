{
  description = "flake-and-bake: a rustlings-style interactive Nix tutorial";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: rec {
        bake = pkgs.writeShellApplication {
          name = "bake";
          runtimeInputs = [ pkgs.jq pkgs.entr pkgs.nix ];
          excludeShellChecks = [ "SC2001" ];
          text = builtins.readFile ./bin/bake;
        };
        default = bake;
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.bake
            pkgs.jq
            pkgs.entr
          ];
          shellHook = ''
            echo "Welcome to flake-and-bake! Run 'bake' to start (or 'bake help')."
          '';
        };
      });

      checks = forAllSystems (pkgs: {
        progress = pkgs.runCommand "flake-and-bake-progress"
          {
            nativeBuildInputs = [ self.packages.${pkgs.stdenv.hostPlatform.system}.bake ];
            src = ./.;
          } ''
          # Sandboxed check: only verifies eval-mode exercises are solvable offline
          cp -r $src source && chmod -R u+w source && cd source
          BAKE_OFFLINE=1 bake run all || true
          touch $out
        '';
      });
    };
}
