# SITH OS

**The Dark Side of Linux**

A custom Arch Linux distribution featuring a hand-crafted Sith Cyberpunk desktop environment. Built with `archiso`, Sith OS packages a fully themed KDE Plasma experience into an installable live ISO — from boot splash to terminal prompt. ~190 curated packages, 178 config files, 10 custom commands, and a Calamares graphical installer.

## Features

### Full Boot Chain Theming
- **GRUB** — Custom cyberpunk bootloader theme
- **Plymouth** — Animated boot splash with pulsing Sith branding
- **SDDM** — Themed login screen
- **KDE Plasma** — Complete Cyber Neon desktop theme

### Desktop Environment
- KDE Plasma with Cyber Neon color scheme
- Kvantum Qt theme engine
- Breeze window decorations with Sith color accents
- Papirus-Dark icon theme
- 4 virtual desktops: KORRIBAN, MALACHOR, DROMUND, EXEGOL
- KWin effects: blur, glide, wobbly windows, magic lamp
- 5 curated cyberpunk wallpapers

### Terminal Experience
- **Kitty** terminal with translucent Sith color scheme
- **Starship** prompt with custom Sith Cyberpunk palette
- **Fastfetch** with Sith pyramid ASCII art and Star Wars-themed labels
- **btop** with custom Sith Cyberpunk theme
- **Conky** desktop HUD with GPU monitoring and Sith quotes
- **CAVA** audio visualizer with purple-to-cyan gradient
- **lazygit**, **yazi**, **bat** — all themed to match

### Modern CLI Toolkit
`eza` · `bat` · `dust` · `fd` · `fzf` · `zoxide` · `lazygit` · `yazi` · `glow` · `tldr`

### Eye Candy
`cmatrix` · `lolcat` · `figlet` · `toilet`

### Gaming Ready
- Steam + Proton pre-installed
- Lutris for GOG/Epic/other launchers
- MangoHud FPS overlay
- GameMode automatic performance optimization
- Wine Staging for Windows apps
- 32-bit Vulkan/Mesa support

### Developer Ready
- Docker + Docker Compose
- Python, Node.js, Rust (rustup), Go, CMake
- Git with delta side-by-side diffs
- Neovim with Sith Cyberpunk theme
- Paru AUR helper pre-installed

### System Protection
- BTRFS automatic snapshots with Snapper
- Boot-from-snapshot recovery via grub-btrfs
- Firewalld firewall enabled by default
- Fallback kernel (linux-lts)

### Performance Optimized
- Zram compressed swap
- SSD TRIM automation
- Tuned sysctl parameters
- Parallel package downloads
- Reflector mirror auto-ranking
- Optimized makepkg for AUR builds

### Custom Commands

| Command | Description |
|---------|-------------|
| `sith-fetch` | Custom system info display with Sith pyramid ASCII art |
| `sith-theme` | Apply or reset the Sith Cyberpunk theme |
| `sith-wallpaper` | Cycle through or select curated cyberpunk wallpapers |
| `sith-showcase` | Automated desktop showcase / screenshot tour |
| `sithos-welcome` | Interactive welcome app with system overview |
| `sithos-install` | Launch the Calamares graphical installer |
| `sithos-first-boot` | One-time post-install personalization wizard |
| `sithos-hwdetect` | Detect GPU and recommend/install appropriate drivers |
| `sithos-maintain` | System maintenance: updates, cache cleanup, snapshots |
| `sithos-setup-sounds` | Configure desktop sound theme on first boot |

## Architecture

```
sith-os/
├── archlive/                    # archiso profile
│   ├── profiledef.sh            # ISO metadata & build config
│   ├── packages.x86_64          # ~190 curated packages
│   ├── pacman.conf               # Package manager config
│   ├── airootfs/                 # Root filesystem overlay
│   │   ├── etc/
│   │   │   ├── skel/            # Default user home template
│   │   │   │   ├── .config/     # 15+ themed app configs
│   │   │   │   │   ├── kitty/   bat/   btop/   cava/
│   │   │   │   │   ├── conky/   fastfetch/   lazygit/
│   │   │   │   │   ├── nvim/    yazi/  tmux/  Kvantum/
│   │   │   │   │   ├── gtk-3.0/  autostart/
│   │   │   │   │   └── ...
│   │   │   │   ├── .local/      # Plasma theme, color scheme
│   │   │   │   └── .bashrc      # Themed shell with modern CLI
│   │   │   ├── calamares/       # Graphical installer config
│   │   │   │   ├── settings.conf
│   │   │   │   ├── branding/
│   │   │   │   └── modules/
│   │   │   ├── sddm.conf.d/    # Display manager config
│   │   │   ├── plymouth/        # Boot splash config
│   │   │   ├── sysctl.d/        # Kernel tuning parameters
│   │   │   ├── pacman.d/        # Mirrorlist & hooks
│   │   │   ├── systemd/         # Service enablement
│   │   │   └── xdg/             # XDG autostart entries
│   │   └── usr/
│   │       ├── share/
│   │       │   ├── sddm/themes/cyberpunk/
│   │       │   ├── plymouth/themes/cyberpunk/
│   │       │   ├── wallpapers/sithos/
│   │       │   ├── sithos/      # Branding assets
│   │       │   └── icons/       # Icon overrides
│   │       └── local/bin/       # 10 custom Sith OS commands
│   ├── grub/                    # GRUB bootloader config
│   ├── syslinux/                # BIOS boot config
│   └── efiboot/                 # UEFI boot config
├── build.sh                     # ISO build script
├── test.sh                      # QEMU test script
├── CONTRIBUTING.md              # Contributor guide
├── LICENSE                      # MIT License
└── README.md
```

## Building

### Prerequisites
- Arch Linux host system
- `archiso` package installed
- Chaotic-AUR configured (for Calamares and AUR packages)
- ~15GB free disk space
- Internet connection (for package downloads)

### Build
```bash
git clone https://github.com/JROtto5/sith-os.git
cd sith-os
sudo ./build.sh
```

The ISO will be output to `out/sithos-YYYY.MM.DD-x86_64.iso`

### Test in QEMU
```bash
# UEFI mode (default)
./test.sh

# BIOS mode
./test.sh bios
```

## Installation

1. Flash the ISO to a USB drive:
   ```bash
   sudo dd if=out/sithos-*.iso of=/dev/sdX bs=4M status=progress
   ```
2. Boot from USB
3. The live desktop loads automatically with full theming
4. Click "Install Sith OS" on the desktop, or run `sithos-install` in a terminal
5. Follow the Calamares graphical installer

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Deep Void | `#080112` | Primary background |
| Dark Purple | `#0f031e` | Secondary background |
| Sith Purple | `#1a0535` | Tertiary background |
| Neon Purple | `#b400ff` | Primary accent |
| Sith Red | `#ff0033` | Alerts |
| Hot Pink | `#ff0050` | Cursor / highlights |
| Neon Cyan | `#00ffc8` | Secondary accent |
| Amber | `#ffaa00` | Warnings |
| Lavender | `#e6dcff` | Primary text |

## Technology Stack

- **Build system:** archiso (mkarchiso)
- **Desktop:** KDE Plasma 6 / Wayland
- **Display manager:** SDDM
- **Installer:** Calamares
- **Boot splash:** Plymouth (custom script theme)
- **Bootloader:** GRUB + systemd-boot (dual BIOS/UEFI)
- **Audio:** PipeWire
- **Shell:** Bash + Starship prompt
- **Theming:** Kvantum, Breeze, custom KDE color scheme
- **Snapshots:** Snapper + grub-btrfs
- **Firewall:** Firewalld

## Skills Demonstrated

- Linux systems engineering (initramfs, bootloaders, systemd services)
- Desktop environment packaging and distribution
- Shell scripting and automation
- UI/UX theming across 15+ applications
- Build system configuration (archiso/mkarchiso)
- System architecture and file system overlay design
- CI/CD pipeline with GitHub Actions

## License

MIT

---

*Peace is a lie. There is only passion.*
