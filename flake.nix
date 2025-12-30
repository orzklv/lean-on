{
  description = "Lean 4 introduction for Orzklv";

  inputs = {
    nixpkgs.follows = "lean4-nix/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    lean4-nix.url = "github:lenianiva/lean4-nix";
  };

  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    lean4-nix,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = {
        system,
        pkgs,
        ...
      }: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          # https://github.com/lenianiva/lean4-nix/issues/76
          overlays = [(lean4-nix.readToolchainFile {
            toolchain = ./lean-toolchain;
            binary = system != "aarch64-darwin";
          })];
        };

        packages.default =
          (pkgs.lean.buildLeanPackage {
            name = "Leanon";
            roots = ["Main"];
            src = pkgs.lib.cleanSource ./.;
          })
          .executable;

        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            nixd
            lean.lean-all
          ];
        };
      };
    };
}
