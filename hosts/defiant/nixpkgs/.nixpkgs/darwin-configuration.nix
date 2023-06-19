{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    awscli2
    aws-mfa
    bat
    direnv
    elixir
    fd
    fish
    fzf
    htop
    httpie
    jdk17
    jq
    lazygit
    neovim
    niv
    nodejs-18_x
    pandoc
    ranger
    ripgrep
    rustup
    stow
    tig
    tmux
    watch
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

  environment.shells = with pkgs; [ fish ];

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