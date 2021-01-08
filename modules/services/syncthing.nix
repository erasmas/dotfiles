{ pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    dataDir = "/home/erasmas/Sync";
    configDir = "/home/erasmas/.config/syncthing";
    user = "erasmas";
  };
}

