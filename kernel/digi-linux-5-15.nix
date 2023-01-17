{ config, lib, pkgs, ... }@args:
with lib;
pkgs.buildLinux (args // rec {
  version = "5.15.50";

  defconfig = "ccimx8_defconfig";

  src = pkgs.fetchFromGithub {
    owner = "digi-embedded";
    repo = "linux";
    rev = "55e3f4eb30296a8cc0df9392ffd630a10348e854";
    sha256 = "sha256-0003gxCuWHpFXjxqFIUGP1ApWsq7+fCC4nFB693Sdg0=";
  };

  autoModules = false;
  extraConfig = ''
  '';
} // (args.argsOverride or {}))
