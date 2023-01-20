{ config, lib, pkgs, ... }:

let
  pkgsAarch64 = if pkgs.stdenv.buildPlatform.isAarch64 then pkgs else pkgs.pkgsCross.aarch64-multiplatform;
in rec {
  digi-linux-5-4 = pkgsAarch64.callPackage ./kernel/digi-linux-5-4.nix {};
}
