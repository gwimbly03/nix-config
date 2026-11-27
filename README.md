# NixOS configuration

This flake manages two NixOS systems. Home Manager is part of each system configuration, so a NixOS rebuild also applies that host’s user packages and dotfiles.

| Flake output | Desktop | Bootloader |
| --- | --- | --- |
| `Megatronus` | Hyprland, with NVIDIA and Steam settings | GRUB (UEFI) |
| `Cyclonus` | Niri | systemd-boot (UEFI) |

The output names and directory names are case-sensitive. The command examples use Bash and select `Megatronus`. Change the host to `Cyclonus` when setting up that machine.

## Install from the NixOS live ISO

### 1. Boot the installer and mount the target disks

Boot the NixOS ISO in UEFI mode, connect to the internet, and open a root shell with `sudo -i`. Use `lsblk -f` to identify the target disk. Follow the manual’s partitioning and formatting steps for a root filesystem and a FAT32 EFI System Partition. Formatting erases data on the selected partitions. [Official NixOS installation manual](https://nixos.org/manual/nixos/stable/#sec-installation-manual)

Mount the root filesystem at `/mnt` and the EFI partition at `/mnt/boot`. Replace both device placeholders with your actual devices:

```bash
mount /dev/ROOT_PARTITION /mnt
mkdir -p /mnt/boot
mount /dev/EFI_PARTITION /mnt/boot
findmnt -R /mnt
```

For Btrfs, mount the intended root subvolume at `/mnt` and mount any additional subvolumes before generating the hardware config. Both checked-in layouts use `@` for root and `@home` for `/home`. Megatronus also mounts `@log` at `/var/log` and `@pkg` at `/nix`. If you use swap, activate it before generating the hardware config.

### 2. Clone the flake and set the account name

In the live root shell, set `host` and `account` for the installation. Keep that shell open for the following steps.

```bash
host=Megatronus
account=gwimbly

mkdir -p "/mnt/home/$account"
git clone https://github.com/towelie03/nix-config.git "/mnt/home/$account/.nix-config"
cd "/mnt/home/$account/.nix-config"
```

If the ISO lacks Git, start a shell with `nix --extra-experimental-features 'nix-command flakes' shell nixpkgs#git`, then run the block in that shell. For a private fork, use a clone URL your installer can access.

Set `uname` in [flake.nix](flake.nix) to match `account`. After boot, the checkout will be at `~/.nix-config`, the path used by `nh` and the wallpaper configuration.

### 3. Generate the hardware configuration

Generate the selected host’s hardware file from the mounted target. The checked-in hardware files refer to the original machines’ disks.

```bash
nixos-generate-config --root /mnt --show-hardware-config > "hosts/$host/hardware-configuration.nix"
```

Review that file and `hosts/$host/configuration.nix` before installing. Verify the root and EFI mounts, any additional filesystems, and the graphics driver for your machine. Megatronus explicitly selects NVIDIA. Keep the host’s existing `system.stateVersion` and Home Manager’s `home.stateVersion` when reinstalling the same configuration.

### 4. Install and set the user password

Run from the checkout, still in the live root shell:

```bash
nixos-install --root /mnt --flake ".#$host"
```

Set a root password when prompted. Then set the regular user’s password in the installed system and give that account ownership of the checkout created from the live root shell:

```bash
nixos-enter --root /mnt --command "/nix/var/nix/profiles/system/sw/bin/passwd '$account'"
nixos-enter --root /mnt --command "/nix/var/nix/profiles/system/sw/bin/chown -R '$account:users' '/home/$account/.nix-config'"
nixos-enter --root /mnt --command "/nix/var/nix/profiles/system/sw/bin/chown '$account:users' '/home/$account'"
```

Reboot into the installed system, remove the installer media, and log in with the account you configured.

From the console, run `start-hyprland` on Megatronus or `niri-session` on Cyclonus.

## Apply the flake to an existing NixOS install

Clone to `~/.nix-config` as your regular user and set `uname` in `flake.nix` to your existing username. For a freshly installed system, copy its generated hardware file into the selected host directory. Review the result, especially the EFI mount and any additional disks, before switching.

```bash
host=Megatronus
git clone https://github.com/towelie03/nix-config.git "$HOME/.nix-config"
cd "$HOME/.nix-config"
cp /etc/nixos/hardware-configuration.nix "hosts/$host/hardware-configuration.nix"
```

If your installer stored the hardware configuration elsewhere, use that file. Make the `uname` edit and hardware review before running the first switch:

```bash
NIX_CONFIG='experimental-features = nix-command flakes' nix build ".#nixosConfigurations.${host}.config.system.build.toplevel" --no-link
sudo env NIX_CONFIG='experimental-features = nix-command flakes' nixos-rebuild switch --flake ".#$host"
```

Use your current installation’s privilege command for that first switch. Both flake hosts enable flakes and use `doas` for later rebuilds.

## Set up your local Git identity

The Home Manager Git module includes `~/.config/git/local.conf`. Run this once per host as your regular user, substituting the email you want recorded in commits.

```bash
mkdir -p "$HOME/.config/git"
(umask 077; git config --file "$HOME/.config/git/local.conf" user.email 'you@example.com')
git config --global --includes --get user.email
```

Commit signing uses the SSH key at `~/.ssh/id_ed25519.pub`. Restore the matching key pair on the new host or generate a key and update the signing key path in [modules/utils/git.nix](modules/utils/git.nix). Keep the private key outside the flake checkout.

## Repository layout

```text
.
├── flake.nix
├── flake.lock
├── hosts/
│   ├── Cyclonus/
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── home.nix
│   └── Megatronus/
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── home.nix
├── env/
│   ├── Cyclonus.nix
│   ├── Megatronus.nix
│   ├── env.nix
│   └── stylix/
│       └── stylix.nix
├── modules/
│   ├── apps/
│   ├── desktop/
│   │   ├── dms/
│   │   ├── hypr/
│   │   ├── niri/
│   │   └── serpantinum/
│   ├── nixvim/
│   ├── steam/
│   └── utils/
├── pkgs/
│   ├── Cyclonus/
│   │   ├── packages.nix
│   │   └── hm_packages.nix
│   └── Megatronus/
│       ├── packages.nix
│       └── hm_packages.nix
├── assets/
│   ├── icons/
│   ├── themes/
│   └── wallpapers/
└── README.md
```

Edit `configuration.nix` for system settings and `home.nix` for Home Manager settings. The two package lists under `pkgs/<Host>/` cover system and user packages respectively. Edit `env/<Host>.nix` for host-specific environment variables and [env/env.nix](env/env.nix) for shared defaults.

## Rebuild, update, and roll back

From the checkout, choose the host and build before switching:

```bash
cd "$HOME/.nix-config"
host=Megatronus
nix build ".#nixosConfigurations.${host}.config.system.build.toplevel" --no-link
doas nixos-rebuild switch --flake ".#$host"
```

When you add a file that the flake imports, add it to Git before rebuilding so Nix includes it in the flake source. To update all locked inputs, run `nix flake update`. To update only Nixpkgs, run `nix flake update nixpkgs`. Review `git diff -- flake.lock` and rebuild after updating.

If a new generation fails to boot, select a previous generation from the boot menu. From a running system, use `doas nixos-rebuild switch --rollback` to activate the previous generation. For failed services, check `journalctl -b -p err`. If a boot fails after changing disks, compare the generated filesystem entries with the current mounts and UUIDs.
