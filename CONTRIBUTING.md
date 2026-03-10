# Contributing to Sith OS

Thanks for your interest in contributing to the Dark Side of Linux.

## Building from Source

```bash
# Clone
git clone https://github.com/JROtto5/sith-os.git
cd sith-os

# Setup Chaotic-AUR (needed for Calamares and AUR packages)
./setup-chaotic-aur.sh

# Build ISO
sudo ./build.sh

# Test in QEMU
./test.sh
```

## Project Structure

- `archlive/` — archiso profile (this IS the distro)
  - `profiledef.sh` — ISO metadata and build configuration
  - `packages.x86_64` — Package list
  - `pacman.conf` — Build-time package manager config
  - `airootfs/` — Root filesystem overlay
    - `etc/skel/` — Default user home directory template
    - `etc/calamares/` — Installer configuration
    - `usr/local/bin/` — Custom Sith OS commands
    - `usr/share/sithos/` — Branding assets
- `build.sh` — Build script
- `test.sh` — QEMU test script

## How to Contribute

### Adding a Package
1. Add it to `archlive/packages.x86_64` in the appropriate section
2. If it needs configuration, add configs to `archlive/airootfs/etc/skel/.config/`
3. Test the build

### Theming a New App
1. Configure the app with the Sith Cyberpunk palette
2. Add the config to `archlive/airootfs/etc/skel/.config/<app>/`
3. Theme colors: `#b400ff` (purple), `#00ffc8` (cyan), `#ff0033` (red), `#080112` (bg)

### Adding a Custom Command
1. Create the script in `archlive/airootfs/usr/local/bin/`
2. Add the file to `file_permissions` in `profiledef.sh`
3. Prefix with `sith-` or `sithos-`

## Code Style
- Shell scripts: `#!/bin/bash`, `set -euo pipefail` where safe
- Use the Sith OS color variables for terminal output
- Keep scripts POSIX-friendly where possible

## Testing
Always test changes by building the ISO and booting in QEMU before submitting a PR.
