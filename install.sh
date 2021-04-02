#!/usr/bin/env bash

nix flake update --recreate-lock-file

nix build .#darwinConfigurations.bootstrap.system

./result/sw/bin/darwin-rebuild switch --flake .#bootstrap

darwin-rebuild switch --flake .#MacBookPro
