{
  # CPU frequency scaling: https://wiki.archlinux.org/index.php/CPU_frequency_scaling
  # Config based on: https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141/3

  services.tlp = {
    enable = true;
    extraConfig = ''
      START_CHARGE_THRESH_BAT0=75
      STOP_CHARGE_THRESH_BAT0=80

      START_CHARGE_THRESH_BAT1=75
      STOP_CHARGE_THRESH_BAT1=80

      CPU_SCALING_GOVERNOR_ON_AC=schedutil
      CPU_SCALING_GOVERNOR_ON_BAT=schedutil

      CPU_SCALING_MIN_FREQ_ON_AC=800000
      CPU_SCALING_MAX_FREQ_ON_AC=3400000
      CPU_SCALING_MIN_FREQ_ON_BAT=800000
      CPU_SCALING_MAX_FREQ_ON_BAT=2300000

      # Enable audio power saving for Intel HDA, AC97 devices (timeout in secs).
      # A value of 0 disables, >=1 enables power saving (recommended: 1).
      # Default: 0 (AC), 1 (BAT)
      SOUND_POWER_SAVE_ON_AC=0
      SOUND_POWER_SAVE_ON_BAT=1

      # Runtime Power Management for PCI(e) bus devices: on=disable, auto=enable.
      # Default: on (AC), auto (BAT)
      RUNTIME_PM_ON_AC=on
      RUNTIME_PM_ON_BAT=auto

      # Battery feature drivers: 0=disable, 1=enable
      # Default: 1 (all)
      NATACPI_ENABLE=1
      TPACPI_ENABLE=1
      TPSMAPI_ENABLE=1
    '';
  };
}
