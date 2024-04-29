{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    pkgsForEach = nixpkgs.legacyPackages;
  in {
    darwinConfigurations."jamescollings-macbook" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/mac
        home-manager.darwinModules.home-manager
      ];

      specialArgs = {
        inherit self inputs;
      };
    };

    formatter = forAllSystems (system: pkgsForEach.${system}.alejandra);

    devShells = forAllSystems (system: {
      default = pkgsForEach.${system}.mkShellNoCC {
        packages = with pkgsForEach.${system}; [
          statix
          deadnix
          alejandra
        ];
      };
    });
  };
}
