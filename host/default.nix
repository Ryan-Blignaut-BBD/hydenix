{
  nixpkgs,
  home-manager,
  username,
  gitUser,
  gitEmail,
  host,
  defaultPassword,
  system,
  pkgs,
}:

nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      pkgs
      username
      gitUser
      gitEmail
      host
      defaultPassword
      ;
  };
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} =
        { pkgs, ... }:
        {
          imports = [
            ./home.nix
          ];
        };
      home-manager.extraSpecialArgs = {
        inherit
          username
          gitUser
          gitEmail

          ;
      };
    }
  ];
}
