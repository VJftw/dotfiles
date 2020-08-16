#!/bin/bash
set -euxo pipefail

sudo apt-get install -y zsh

sudo chsh -s /usr/bin/zsh $(whoami)
