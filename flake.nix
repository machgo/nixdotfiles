{
    description = "first test";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";

        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs"; #make sure versions of packages follow nixpkgs

        obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
        nvf = {
          url = "github:NotAShelf/nvf";
          # You can override the input nixpkgs to follow your system's
          # instance of nixpkgs. This is safe to do as nvf does not depend
          # on a binary cache.
          inputs.nixpkgs.follows = "nixpkgs";
          # Optionally, you can also override individual plugins
          # for example:
          inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
        };
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
