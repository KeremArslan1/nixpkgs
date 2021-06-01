#!/usr/bin/env bash

nix flake update 

nix build .#darwinConfigurations.bootstrap.system

./result/sw/bin/darwin-rebuild switch --flake .#bootstrap

darwin-rebuild switch --flake .#MacBookPro

echo "Upgrading stackline ..."
cd ~/.hammerspoon/stackline && git pull

echo "Upgrading simple-bar ..."
cd "~/Library/Application Support/†bersicht/widgets/simple-bar" && git pull

echo "Upgrading neovim ..."
brew reinstall neovim

echo "Upgrading npm packages ..."
npm update -y

echo "Upgrading python packages ..."
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
