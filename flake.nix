{
  description = "NixOS config flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    }; 

    nixvim = { 
      url = "github:nix-community/nixvim";
    }; 

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
};


outputs = { self, nixpkgs, home-manager, nixvim, nur, hyprland, nixcord, niri, stylix, dms, dms-plugin-registry, ... }@inputs:
  {
    nixosConfigurations = {
      Cyclonus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self inputs; };
        modules = [
          ./hosts/Cyclonus/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
        ];
      };

      Megatronus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit self inputs; };
          modules = [
            ./hosts/Megatronus/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
      };
    };
  };
}

