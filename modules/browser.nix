{ config, lib, pkgs, ... }:

{
  nixpkgs.config.firefox.enableTridactylNative = true;

  environment.systemPackages = with pkgs; [
    firefox
    chromium
    # stable one is not available on the Tor servers anymore
    unstable.tor-browser-bundle-bin
  ];
}
