{
  self,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/common.nix
  ];

  security.pam.enableSudoTouchIdAuth = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit self inputs;
    };

    users.jamescollings = import ./home;
  };

  users.users.jamescollings = {
    home = "/Users/jamescollings";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;
}
