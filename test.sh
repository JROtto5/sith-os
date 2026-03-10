#!/bin/bash
# ══════════════════════════════════════════
# SITH OS — QEMU Test Script
# ══════════════════════════════════════════
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ISO=$(ls -t "${SCRIPT_DIR}"/out/*.iso 2>/dev/null | head -1)

if [[ -z "$ISO" ]]; then
    echo "No ISO found in out/ — run ./build.sh first"
    exit 1
fi

MODE="${1:-uefi}"

echo "Testing: $ISO"
echo "Mode: $MODE"
echo ""

case "$MODE" in
    uefi)
        echo "Launching QEMU (UEFI mode)..."
        qemu-system-x86_64 \
            -bios /usr/share/edk2/x64/OVMF.4m.fd \
            -cdrom "$ISO" \
            -m 4G \
            -smp 4 \
            -enable-kvm \
            -vga virtio \
            -display sdl,gl=on \
            -boot d \
            -device virtio-net-pci,netdev=net0 \
            -netdev user,id=net0
        ;;
    bios)
        echo "Launching QEMU (BIOS mode)..."
        qemu-system-x86_64 \
            -cdrom "$ISO" \
            -m 4G \
            -smp 4 \
            -enable-kvm \
            -vga virtio \
            -display sdl,gl=on \
            -boot d \
            -device virtio-net-pci,netdev=net0 \
            -netdev user,id=net0
        ;;
    *)
        echo "Usage: ./test.sh [uefi|bios]"
        exit 1
        ;;
esac
