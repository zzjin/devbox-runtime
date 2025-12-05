#!/usr/bin/env bash
set -euo pipefail

DEFAULT_DEVBOX_USER=${DEFAULT_DEVBOX_USER:-devbox}

if ! id -u "$DEFAULT_DEVBOX_USER" &>/dev/null; then
  echo "User $DEFAULT_DEVBOX_USER does not exist"
  exit 1
fi

# Set ownership to default devbox user
chown -R $DEFAULT_DEVBOX_USER:$DEFAULT_DEVBOX_USER /home/$DEFAULT_DEVBOX_USER/project
chmod +x /home/$DEFAULT_DEVBOX_USER/project/entrypoint.sh