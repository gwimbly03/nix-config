{
  description = "NixOS config flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    }; 

    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    nixvim = { 
      url = "github:nix-community/nixvim";
    }; 

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nixpkgs.follows = "nix-gaming";
    };
  };


outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixvim, nur, stylix, dms, nixcord, ... }@inputs:
  let 
      system = "x86_64-linux";
  in 
  {
      nixosConfigurations = {
      Cyclonus = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit self inputs; };
        modules = [
          ./hosts/Cyclonus/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
        ];
      };

      Megatronus = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./hosts/Megatronus/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.default
          ];
      };
    };
  };
}

