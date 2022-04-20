{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    slack
    unstable.tdesktop
    signal-desktop
  ];
}
