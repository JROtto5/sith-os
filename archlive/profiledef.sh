#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="sithos"
iso_label="SITHOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Sith OS <https://github.com/JROtto5/sith-os>"
iso_application="Sith OS Live/Install Medium"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '256K' '-Xdict-size' '256K' '-processors' '4')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/skel"]="0:0:755"
  ["/usr/local/bin/sithos-welcome"]="0:0:755"
  ["/usr/local/bin/sith-wallpaper"]="0:0:755"
  ["/usr/local/bin/sith-showcase"]="0:0:755"
  ["/usr/local/bin/sithos-setup-sounds"]="0:0:755"
  ["/usr/local/bin/sith-theme"]="0:0:755"
  ["/usr/local/bin/sith-fetch"]="0:0:755"
  ["/usr/local/bin/sithos-hwdetect"]="0:0:755"
  ["/usr/local/bin/sithos-first-boot"]="0:0:755"
  ["/usr/local/bin/sithos-install"]="0:0:755"
  ["/usr/local/bin/sithos-maintain"]="0:0:755"
  ["/usr/local/bin/sithos-drivers"]="0:0:755"
  ["/root/customize_airootfs.sh"]="0:0:755"
)
