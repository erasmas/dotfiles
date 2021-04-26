{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unstable.vscodium
  ];
}
