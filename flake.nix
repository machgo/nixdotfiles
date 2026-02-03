{
    description = "first test";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; #make sure versions of packages follow nixpkgs
    };
    outputs = {self, nixpkgs, home-manager, ...}: {
        nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager 
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.marco = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
