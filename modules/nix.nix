{
  pkgs,
  inputs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nixVersions.unstable;

    registry = {
      n.flake = inputs.nixpkgs;
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
    ];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

      build-users-group = "nixbld";
      builders-use-substitutes = true;
      trusted-users = ["jamescollings"];
      sandbox = true;
      use-xdg-base-directories = true;

      nix-path = config.nix.nixPath;

      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
