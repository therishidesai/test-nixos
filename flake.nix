{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    legacyPackages.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.callPackage ./default.nix {};
  };
}
