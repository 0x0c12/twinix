{
  description = "System flakes ig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };

    in
    {
    nixosConfigurations = {
      twinix = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system home-manager; };
        
        modules = [
          ./nixos/configuration.nix

          # home-manager.nixosModules.home-manager
          # {
            # home-manager.useGlobalPkgs = true;
            # home-manager.useUserPackages = true;
            # home-manager.users.twilight = import ./nixos/home.nix;
          # }
        ];
      };
    };

      homeConfigurations.twilight = 
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
	    ./nixos/home.nix
	  ];
        };

    };
}
