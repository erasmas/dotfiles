{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    aws-mfa
    bat
    direnv
    fd
    fish
    htop
    jq
    k9s
    neovim
    ranger
    ripgrep
    stow
    tig
    timg
    tmux
    zoxide
  ];

  services.nix-daemon.enable = true;
  services.lorri.enable = true;

  programs.fish.enable = true;
  environment.shells = with pkgs; [ bashInteractive fish zsh ];

  fonts = with pkgs; {
    fontDir.enable = true;
    fonts = [
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  
  networking.hostName = "defiant";

}
