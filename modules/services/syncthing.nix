{ pkgs, ... }:

services.syncthing = {
  enable = true;
  dataDir = "/home/erasmas/Sync/Default";
  user = "erasmas";
};

