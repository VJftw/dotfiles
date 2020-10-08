#!/bin/bash
set -euxo pipefail

curl -fsSL https://get.docker.com | bash

sudo usermod -aG docker $(whoami)
newgrp docker
