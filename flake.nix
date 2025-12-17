{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

 outputs = { nixpkgs, home-manager, ... }: {
  nixosConfigurations.vodrech = nixpkgs.lib.nixosSystem {
    system="x86_64-linux";
    modules = [
      ./hosts/vodrech/configurations.nix
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
	  useUserPackages = true;
	  users.vodrech = import ./hosts/vodrech/home.nix;
          backupFileExtension = "backup";
         };
       }
     ];
    };
   };
}
