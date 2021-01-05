#!/usr/bin/env bash

nix-env --delete-generations old
nix-collect-garbage
nix-collect-garbage -d
nix-store --gc --print-dead
