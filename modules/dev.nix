{ pkgs, ... }:

{
  imports = [
    services/lorri.nix 
  ];

  # Nix Flakes
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
        experimental-features = nix-command flakes
    '';
  };

  environment.systemPackages = with pkgs; [
    # Common libraries & tools
    rlwrap
    gitAndTools.tig
  ];
}
