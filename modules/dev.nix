{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # AWS
    awscli
    s3cmd

    # Clojure
    clojure
    clj-kondo
    leiningen

    # Go
    go
    go-tools

    # Haskell
    stack

    # Java
    jdk
    maven
    visualvm
    # TODO create package for the eclipse mat

    # Nix
    nixfmt

    # Python
    python37
    python37Packages.black
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.virtualenv
    python37Packages.virtualenvwrapper
    tk

    # Rust
    musl
    rustup
    rustfmt
    rustracer
    # TODO switch to latest stable Rust and install clippy, rust-src, rustfmt
    # rustup toolchain install stable
    # rustup default stable
    # rustup component add clippy
    # rustup component add rust-src
    # rustup component add rustfmt

    # Scala
    sbt

    # Common libraries & tools
    clang
    gdb
    openssl
    rlwrap
  ];
}
