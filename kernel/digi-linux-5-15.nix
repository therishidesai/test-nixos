{ config, lib, pkgs, ... }@args:
with lib;
pkgs.buildLinux (args // rec {
  version = "5.4.84";

  defconfig = "ccimx8_defconfig";

  src = pkgs.applyPatches {

    src = pkgs.fetchFromGitHub {
      owner = "digi-embedded";
      repo = "linux";
      rev = "d328d158f04a55b2af1cded556f13bcbf551e84a";
      sha256 = "sha256-8II5ijsTY+Muv3I2wbc5bDuHqDN8TwNUeKkGAw3S720=";
    };

    postPatch = ''
     rm \
        arch/arm64/boot/dts/digi/_ov_board_flexcan1_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_flexspi_ccimx8m-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_flexspi_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_gpio-watchdog_ccimx8m-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_gpio-watchdog_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_hsd101pfw2-lvds_ccimx8m-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_hsd101pfw2-lvds_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_lpuart3_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_lt8912-hdmi-dsi0_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_lvds1_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_lvds_ccimx8m-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_v1-v2_ccimx8mn-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_v1-v3_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_parallel-camera_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_pcie-card_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_pcie-modem_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_board_user-leds_ccimx8m-dvk.dts \
        arch/arm64/boot/dts/digi/_ov_board_user-leds_ccimx8x-sbc-pro.dts \
        arch/arm64/boot/dts/digi/_ov_som_bt_ccimx8m.dts \
        arch/arm64/boot/dts/digi/_ov_som_bt_ccimx8x.dts \
        arch/arm64/boot/dts/digi/_ov_som_mca-keypad_ccimx8x.dts \
        arch/arm64/boot/dts/digi/_ov_som_mca-keypad_ccimx8m.dts \
        arch/arm64/boot/dts/digi/_ov_som_mfg-functional_ccimx8x.dts \
        arch/arm64/boot/dts/digi/_ov_som_quad_ccimx8x.dts \
        arch/arm64/boot/dts/digi/_ov_som_v1_ccimx8mn.dts \
        arch/arm64/boot/dts/digi/_ov_som_wifi_ccimx8m.dts \
        arch/arm64/boot/dts/digi/_ov_som_wifi_ccimx8x.dts \

     sed -i -e '/_ov_/d' \
        arch/arm64/boot/dts/digi/Makefile
    '';
  };

  autoModules = false;
  extraConfig = ''
  '';

  kernelPatches = [];
} // (args.argsOverride or {}))
