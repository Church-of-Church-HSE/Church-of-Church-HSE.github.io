{
  description = "Church of Church website for HSE projects";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    mkdocs-flake.url = "github:applicative-systems/mkdocs-flake";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      inputs.mkdocs-flake.flakeModules.default
    ];
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
    perSystem = { config, self', inputs', pkgs, system, ... }: {
      # Build the docs:
      #     `nix build .#documentation`
      # Run in watch mode for live-editing-rebuilding:
      #     `nix run .#watch-documentation`
      documentation.mkdocs-root = ./docs;
    };
  };
}
