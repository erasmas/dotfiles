{ pkgs, ... }:

{
  imports = [ services/lorri.nix ];

  environment.systemPackages = with pkgs; [
    # AWS
    awscli

    # Clojure
    clojure
    leiningen

    # Haskell
    stack

    # Java
    jdk11
    maven
    visualvm
    # TODO create package for the eclipse mat

    # Python
    python37
    python37Packages.black
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.virtualenv
    python37Packages.virtualenvwrapper
    tk

    # Scala
    sbt

    # Common libraries & tools
    clang
    gdb
    openssl
    rlwrap
    shellcheck
    pv

    # Postgres
    pgcli
  ];
}
