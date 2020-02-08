{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # additional sound settings
    alsaUtils
    pavucontrol

    # UI theme & icons
    arc-theme
    papirus-icon-theme

    # terminal emulator
    termite

    # screen recorders
    flameshot
    peek

    # video player
    ffmpeg
    mpv
    youtube-dl

    # document viewers
    # TODO install foliate, mcomix
    calibre
    gnome3.eog
    libreoffice-still
    zathura
    zotero

    # spell checker
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.uk

    # web
    networkmanager-openvpn
    thunderbird
    transmission
    transmission-gtk

    # network
    mitmproxy
    nmap
    wireshark

    # encryption
    truecrypt
  ];

  networking.networkmanager.enable = true;
  users.users.gsnewmark.extraGroups = [ "networkmanager" ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      dejavu_fonts
      font-awesome
      # TODO use SS07 stylistic set https://unix.stackexchange.com/questions/485982/is-there-a-iosevka-term-package-available-on-nixos
      iosevka
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
        sansSerif = ["Source Sans Pro"];
        serif = ["Source Serif Pro"];
        monospace = ["Iosevka"];
      };
    };
  };
}
