#!/bin/bash
# Bootstrap script for new laptop setup
# Run with: curl -fsSL https://raw.githubusercontent.com/reedmcfadden/workstation/main/bootstrap.sh | bash

set -e

echo "=== Laptop Bootstrap Script ==="
echo ""

# Install prerequisites
echo "[1/4] Installing prerequisites..."
sudo dnf install -y ansible git

# Clone workstation repo if not already present
WORKSTATION_DIR="$HOME/Repos/workstation"
if [ ! -d "$WORKSTATION_DIR" ]; then
    echo "[2/4] Cloning workstation repository..."
    mkdir -p "$HOME/Repos"
    git clone https://github.com/reedmcfadden/workstation.git "$WORKSTATION_DIR"
else
    echo "[2/4] Workstation directory already exists, pulling latest..."
    cd "$WORKSTATION_DIR" && git pull
fi

# Run ansible playbook
echo "[3/4] Running Ansible playbook..."
cd "$WORKSTATION_DIR/ansible"
ansible-playbook setup.yml --ask-become-pass

echo "[4/4] Bootstrap complete!"
echo ""
echo "=== Next Steps ==="
echo "1. Add your credentials to ~/.config/restic/env"
echo "2. Initialize restic: source ~/.config/restic/env && restic init"
echo "3. Restore data: restic restore latest --target ~ --include Documents --include .ssh"
echo ""
echo "Your laptop is configured!"
