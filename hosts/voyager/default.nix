# voyager - my ThinkPad laptop

{ pkgs, ... }:

{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix

    # Desktop Environment
    ../../modules/desktop/gnome.nix

    # Applications
    ../../modules/browser.nix
    ../../modules/chat.nix
    # ../../modules/daw.nix
    ../../modules/dev.nix
    ../../modules/emacs.nix
    # ../../modules/gaming.nix
    # ../../modules/graphics.nix
    ../../modules/music.nix
    ../../modules/recording.nix
    ../../modules/shell/fish.nix
    ../../modules/vm.nix

    # Additional services
    ../../modules/services/fwupd.nix
    ../../modules/services/tlp.nix
    ../../modules/services/syncthing.nix
  ];

  networking.hostName = "voyager";

  # Fix X freezing
  boot.kernelParams = [
    "acpi_osi=Linux"
    "acpi_rev_override=1"
    "iommu=soft"
    "idle=nomwait"
  ];

  # Update CPU microcode
  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl.enable = true;

  # Optimize power use & add battery indicator
  environment.systemPackages = [ pkgs.acpi ];

  # Power management
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
    powertop.enable = true;
  };
  services.thermald.enable = true;

  # Monitor backlight control
  programs.light.enable = true;
}
