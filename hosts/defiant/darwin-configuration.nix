{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    direnv
    fd
    fish
    htop
    jq
    neovim
    ripgrep
    stow
    tmux
    zoxide

    # Hopin
    aws-mfa
    chamber
    docker
    docker-compose
  ];

  services.nix-daemon.enable = true;
  services.lorri.enable = true;

  programs.fish.enable = true;
  environment.shells = with pkgs; [ bashInteractive fish zsh ];

  fonts = with pkgs; {
    fontDir.enable = true;
    fonts = [
	(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
