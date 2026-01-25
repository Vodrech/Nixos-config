{
  description = "Nixos Flake Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    swww.url = "github:LGFae/swww";

    dotfiles.url = "github:vodrech/dotfiles?ref=master";

    rust-overlay.url = "github:oxalica/rust-overlay"; 
  };

  outputs = { self, nixpkgs, swww, home-manager, dotfiles, flake-utils, rust-overlay, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations.vodrech = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/vodrech/configurations.nix
          home-manager.nixosModules.home-manager
          {
	    home-manager = {
	      useGlobalPkgs = true;
	      useUserPackages = true;
              users.vodrech = import ./hosts/vodrech/home.nix {inherit pkgs dotfiles; };
	      # backupFileExtension = "backup";
	      extraSpecialArgs = {swww = swww; };
	    };
          }
        ];
      };
    };
}
