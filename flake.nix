{
    description = "first test";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";
    };
    outputs = {self, nixpkgs,...}:
        let
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = {
                nixbox = lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [ ./configuration.nix ];
                };
            };
        };
}
