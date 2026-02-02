{
    description = "first test";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; #make sure versions of packages follow nixpkgs
    };
    outputs = {self, nixpkgs, home-manager, ...}:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            nixosConfigurations = {
                nixbox = lib.nixosSystem {
                    inherit system;
                    modules = [ ./configuration.nix ];
                };
            };
            homeConfigurations = {
                marco = home-manager.lib.homeManagerConfiguration {
                    pkgs = pkgs;
                    modules = [ ./home.nix ];
                };
            };
        };
}
