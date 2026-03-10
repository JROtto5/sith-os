#!/bin/bash
# ══════════════════════════════════════════
# SITH OS — ISO Build Script
# ══════════════════════════════════════════
set -euo pipefail

RED='\033[1;31m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE="${SCRIPT_DIR}/archlive"
WORK_DIR="/tmp/sithos-build"
OUT_DIR="${SCRIPT_DIR}/out"

echo -e "${PURPLE}"
echo "  ███████╗██╗████████╗██╗  ██╗     ██████╗ ███████╗"
echo "  ██╔════╝██║╚══██╔══╝██║  ██║    ██╔═══██╗██╔════╝"
echo "  ███████╗██║   ██║   ███████║    ██║   ██║███████╗"
echo "  ╚════██║██║   ██║   ██╔══██║    ██║   ██║╚════██║"
echo "  ███████║██║   ██║   ██║  ██║    ╚██████╔╝███████║"
echo "  ╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚═════╝ ╚══════╝"
echo -e "${NC}"
echo -e "${CYAN}  ISO Builder${NC}"
echo ""

# Pre-flight checks
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}  Error: Must run as root (sudo ./build.sh)${NC}"
    exit 1
fi

if ! command -v mkarchiso &>/dev/null; then
    echo -e "${RED}  Error: archiso not installed (pacman -S archiso)${NC}"
    exit 1
fi

# Check local repo exists (contains calamares, paru, chaotic packages)
if [[ ! -f "${SCRIPT_DIR}/localrepo/sithos-local.db.tar.gz" ]]; then
    echo -e "${RED}  Error: Local repo not found. See README for setup.${NC}"
    exit 1
fi

# Check disk space (need ~15GB)
AVAIL=$(df --output=avail /tmp | tail -1)
AVAIL_GB=$((AVAIL / 1024 / 1024))
if [[ $AVAIL_GB -lt 10 ]]; then
    echo -e "${RED}  Error: Need at least 10GB free in /tmp (have ${AVAIL_GB}GB)${NC}"
    exit 1
fi

echo -e "${PURPLE}  ▸${NC} Profile:  ${PROFILE}"
echo -e "${PURPLE}  ▸${NC} Work dir: ${WORK_DIR}"
echo -e "${PURPLE}  ▸${NC} Output:   ${OUT_DIR}"
echo ""

# Clean previous build
if [[ -d "$WORK_DIR" ]]; then
    echo -e "${CYAN}  Cleaning previous build...${NC}"
    rm -rf "$WORK_DIR"
fi

mkdir -p "$OUT_DIR"

# Build
echo -e "${CYAN}  Building ISO...${NC}"
echo -e "${CYAN}  This will take 10-30 minutes depending on your internet speed.${NC}"
echo ""

mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$PROFILE"

echo ""
echo -e "${PURPLE}  ═══════════════════════════════════════════${NC}"
echo -e "${CYAN}  Build complete!${NC}"
echo ""
ls -lh "$OUT_DIR"/*.iso 2>/dev/null
echo ""
echo -e "${PURPLE}  Test with:${NC} ./test.sh"
echo -e "${PURPLE}  ═══════════════════════════════════════════${NC}"
