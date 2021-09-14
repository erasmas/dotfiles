{ pkgs, ... }:

{
  imports = [ services/lorri.nix dev/fsharp.nix];

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

    # Python
    python3
    python3Packages.black
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.virtualenv
    python3Packages.virtualenvwrapper
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

    gitAndTools.tig

    # DevOps
    aws-mfa
    chamber
    terraform_0_13
    terraform-landscape
  ];
}
