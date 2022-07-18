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
    fzf
    htop
    jdk
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

  # https://github.com/LnL7/nix-darwin/issues/122
  programs.fish.shellInit = ''
    for p in /run/current-system/sw/bin
      if not contains $p $fish_user_paths
        set -g fish_user_paths $p $fish_user_paths
      end
    end
  '';

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
