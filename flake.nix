{
  description = "MrXcitement's NixOS  configurations";

  inputs = {
    # NixOS packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    # User Package Management
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        mbp13-11 = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix 
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mike = {
                imports = [ ./home.nix ];
              };
            }
          ];
        };
      };
    };
}
