{ pkgs, ... }:

{
  imports = [ ../services/cron.nix ../services/haveged.nix ];

  environment.systemPackages = with pkgs; [
    # additional sound settings
    alsaUtils
    pavucontrol

    # UI theme & icons
    arc-theme
    papirus-icon-theme
    libsForQt5.qtstyleplugins
    qt5ct

    # terminal emulator
    alacritty

    groff # required for formatted output in terminal

    # screen recorders
    flameshot
    peek

    # video player
    ffmpeg
    mpv
    vlc
    youtube-dl

    # document viewers
    calibre
    gnome.eog
    libreoffice-still
    zathura
    zotero

    # spell checker
    (aspellWithDicts (ds: with ds; [ en en-computers uk ]))

    # web
    networkmanager-openvpn
    # thunderbird
    # fractal # Matrix client

    # network
    mitmproxy
    nmap
    wireshark

    # encryption
    truecrypt
    keepassxc

    ranger
    atool
    ffmpegthumbnailer
    highlight
    imlib2
    mediainfo
    poppler
    w3m
    
    # Clipboard manager
    haskellPackages.greenclip

  ];

  networking.networkmanager.enable = true;
  users.users.erasmas.extraGroups = [ "networkmanager" ];

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 262144;
  };  

  services.gnome.gnome-keyring.enable = true;

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      dejavu_fonts
      font-awesome
      iosevka
      noto-fonts-emoji
      source-han-sans-japanese
      source-han-sans-korean
      source-han-sans-simplified-chinese
      source-han-sans-traditional-chinese
      source-sans-pro
      source-serif-pro
      symbola
      veracrypt
      ubuntu_font_family
    ];

    # TODO just use the dotfile
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        autohint = true;
      };
      defaultFonts = {
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
        monospace = [ "Iosevka" ];
      };
    };
  };
}
