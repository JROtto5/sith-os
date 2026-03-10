#!/usr/bin/env bash
# ══════════════════════════════════════════
# SITH OS — Customize airootfs
# Runs inside the chroot during ISO build
# ══════════════════════════════════════════
set -e

# Add liveuser to system groups (groups are created by packages at this point)
for group in wheel video audio storage network docker; do
    if getent group "$group" &>/dev/null; then
        usermod -aG "$group" liveuser 2>/dev/null || true
    fi
done

# Set default shell
chsh -s /bin/bash liveuser 2>/dev/null || true

# Enable systemd services
systemctl enable NetworkManager.service 2>/dev/null || true
systemctl enable sddm.service 2>/dev/null || true
systemctl enable bluetooth.service 2>/dev/null || true
systemctl enable cups.service 2>/dev/null || true
systemctl enable avahi-daemon.service 2>/dev/null || true
systemctl enable firewalld.service 2>/dev/null || true
systemctl enable docker.service 2>/dev/null || true
systemctl enable fstrim.timer 2>/dev/null || true
systemctl enable reflector.timer 2>/dev/null || true
systemctl enable systemd-timesyncd.service 2>/dev/null || true
systemctl enable tlp.service 2>/dev/null || true
systemctl enable irqbalance.service 2>/dev/null || true
systemctl enable pkgfile-update.timer 2>/dev/null || true
