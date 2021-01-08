# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
      (let nixos-hardware =
             builtins.fetchTarball
               https://github.com/NixOS/nixos-hardware/archive/master.tar.gz;
       in "${nixos-hardware}/lenovo/thinkpad/t480s")
    ];

  boot.initrd.availableKernelModules = [ 
    "xhci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
    "thinkpad_acpi"
  ];

  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "intel_pstate=disable" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/845b270a-37e6-467d-987b-bccb743df6e6";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/4c986414-1adc-410b-bdfd-f01514209e5c";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A700-A1CE";
      fsType = "vfat";
    };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
