#!/usr/bin/env bash
set -euo pipefail

L10N=${L10N:-en_US}
DEFAULT_DEVBOX_USER=${DEFAULT_DEVBOX_USER:-devbox}

export DEBIAN_FRONTEND=noninteractive
apt-get update && \
    curl -sL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g typescript yarn pnpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

export NODE_VERSION=24
export NVM_DIR=/home/$DEFAULT_DEVBOX_USER/.nvm
sudo su $DEFAULT_DEVBOX_USER -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
    && . $NVM_DIR/nvm.sh"

if [ "$L10N" = "zh_CN" ]; then
  sudo su $DEFAULT_DEVBOX_USER -c "npm config set registry https://registry.npmmirror.com"; \
  sudo su root -c "npm config set registry https://registry.npmmirror.com"; \
fi
