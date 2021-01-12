{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    udevil
  ];

  services.devmon.enable = true;}

