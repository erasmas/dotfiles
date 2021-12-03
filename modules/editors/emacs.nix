# I'm using Doom Emacs for everything text-related
# https://github.com/hlissner/doom-emacs
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Doom dependencies
    emacsGit
    git
    (ripgrep.override { withPCRE2 = true; })

    # Optional dependencies
    fd
    gnutls
    zstd

    # Module dependencies
    (aspellWithDicts (ds: with ds; [ en en-computers uk ]))
    unstable.clj-kondo
    discount # for Markdown
    languagetool
    nixfmt
    proselint
    sqlite
    texlive.combined.scheme-medium
    wordnet
  ];

  fonts.fonts = [ pkgs.emacs-all-the-icons-fonts ];
}
