{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    jetpack-nixos = {
      url = "github:anduril/jetpack-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, jetpack-nixos, ... }: {
    nixosConfigurations.test-jp5 = let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        jetpack-nixos.nixosModules.default
        {
          hardware.nvidia-jetpack.enable = true;
          hardware.nvidia-jetpack.som = "orin-agx";
          hardware.nvidia-jetpack.carrierBoard = "devkit";

          boot.kernelPatches = [{
            name = "can-modules";
            patch = null;
            extraConfig = ''
              CAN_J1939 y
            '';
          }];
        }
      ];
    };
  };
}
