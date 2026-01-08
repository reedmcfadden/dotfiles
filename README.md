# workstation

Personal laptop configuration using Ansible. Includes package installation, dotfiles, wallpaper rotation, and automated restic backups to S3.

## Quick Start

On a fresh Fedora install:

```bash
curl -fsSL https://raw.githubusercontent.com/reedmcfadden/workstation/main/bootstrap.sh | bash
```

Or manually:

```bash
sudo dnf install -y ansible git
git clone git@github.com:reedmcfadden/workstation.git ~/Repos/workstation
cd ~/Repos/workstation
ansible-playbook setup.yml --ask-become-pass
```

## What's Included

### Ansible Roles

| Role | Description |
|------|-------------|
| `packages` | CLI tools, desktop apps, dev tools, containers |
| `dotfiles` | Symlinks .bashrc, .vimrc, .tmux.conf, .profile |
| `gnome` | Dark mode, night light, and monospace font settings |
| `restic` | Automated daily backups to S3 with systemd timer |
| `wallpaper` | Wallpaper rotation from folder with systemd timer |

### Packages

**CLI:** git, vim, tmux, htop, curl, wget, rsync, tree, jq, yq, ripgrep, fzf, gh

**Desktop:** gnome-tweaks, firefox, libreoffice, virt-manager, Joplin (flatpak)

**Dev:** gcc, make, ansible, ansible-lint, ShellCheck, python3, podman

### Dotfiles

- `.bashrc` - Vanilla RHEL with vi mode
- `.vimrc` - Vanilla with 2-space tabs
- `.tmux.conf` - Vanilla with vi mode
- `.profile` - Standard path setup

## Post-Setup

After running the playbook, configure restic backups:

```bash
vim ~/.config/restic/env  # Add AWS credentials and password
source ~/.config/restic/env
restic init
```

## Backup Commands

```bash
# Check backup status
systemctl --user list-timers

# Run backup manually
systemctl --user start restic-backup.service

# View snapshots
source ~/.config/restic/env && restic snapshots

# Restore files
restic restore latest --target /tmp/restore --include Documents
```

## Customization

Edit package lists in `roles/packages/vars/main.yml`.
