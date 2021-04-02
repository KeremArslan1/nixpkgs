#!/usr/bin/env bash

nix flake update 

nix build .#darwinConfigurations.bootstrap.system

./result/sw/bin/darwin-rebuild switch --flake .#bootstrap

darwin-rebuild switch --flake .#MacBookPro

brew reinstall neovim
npm update -y
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
