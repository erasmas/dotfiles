{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    slack
    tdesktop
  ];
}
