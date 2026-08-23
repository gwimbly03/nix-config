# NixOS Configuration Repository

This repository contains my NixOS system configurations for two machines:

- **megatronus** – Desktop PC running Hyprland (Wayland compositor)
- **cyclonus** – Laptop/Workstation running Niri (tiling Wayland compositor)

Both configurations are managed via Nix Flakes and make use of `home-manager` for user‑level packages and dotfiles.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Getting the Repository](#getting-the-repository)
3. [Flake Structure](#flake-structure)
4. [Building & Switching Configurations](#building--switching-configurations)
5. [Host‑Specific Details](#host-specific-details)
   - [megatronus (Hyprland)](#megatronus-hyprland)
   - [cyclonus (Niri)](#cyclonus-niri)
6. [Secrets & Sensitive Data](#secrets--sensitive-data)
7. [Updating the System](#updating-the-system)
8. [Troubleshooting](#troubleshooting)
9. [Contributing / Customizing](#contributing--customizing)

---

## Prerequisites

- A working NixOS installation (version ≥ 23.11 recommended) with **flakes** enabled.
  - Ensure `/etc/nix/nix.conf` contains:
    ```ini
    experimental-features = nix-command flakes
    ```
- Internet access to fetch channels and binaries.
- (Optional) `git` for cloning the repository.
- (Optional) `sudo` access for running `nixos-rebuild`.

> **Note:** If you are starting from a non‑NixOS Linux distribution, you can first install NixOS using the official installer and then replace `/etc/nixos` with this repository (see [Installation](#installation-from-scratch) below).

---

## Getting the Repository

Clone the repository to a location of your choice (e.g., `~/dotfiles`):

```bash
git clone https://github.com/gwimbly03/nix-config.git
cd nix-config
```

The repository root contains a `flake.nix` file that defines the flake outputs.

---

## Flake Structure

```
.
├── flake.nix                # Top‑level flake definition
├── flake.lock               # Locked inputs (updated automatically)
├── hosts/
│   ├── common/              # Shared modules, hardware detection, etc.
│   ├── megatronus/
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── cyclonus/
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── modules/
│   ├── desktop/             # WM/DE specific modules (hyprland, niri)
│   ├── programs/            # Application‑specific tweaks
│   └── system/              # Low‑level system services (networking, boot, etc.)
├── users/
│   └── <your-username>/     # Home‑manager configuration (dotfiles, packages)
└── README.md
```

- **hosts/<name>/configuration.nix** – System‑level configuration for that host.
- **hosts/<name>/hardware-configuration.nix** – Auto‑generated hardware config (keep it under version control; regenerate with `nixos-generate-config` if hardware changes).
- **modules/** – Reusable NixOS modules that are imported by the host configurations.
- **users/<username>/** – Home‑manager configuration (see `home.nix`, `programs/`, etc.).

---

## Building & Switching Configurations

### Dry‑run (see what would change)

```bash
# For megatronus
sudo nixos-rebuild dry-run --flake .#megatronus

# For cyclonus
sudo nixos-rebuild dry-run --flake .#cyclonus
```

### Build and switch (recommended for most changes)

```bash
sudo nixos-rebuild switch --flake .#megatronus   # replace megatronus with cyclonus as needed
```

This will:

1. Evaluate the flake.
2. Build the system derivation.
3. Activate the new configuration (making it the boot default).
4. Restart affected services.

### Boot into a specific generation (if something goes wrong)

From the GRUB menu you can select a previous generation, or run:

```bash
sudo nixos-rebuild boot --flake .#megatronus   # sets next boot only
```

Then reboot and choose the new entry.

### Just build (no activation)

```bash
nix build .#nixosConfigurations.megatronus.config.system.build.toplevel
```

The result symlink will be at `./result`.

---

## Host‑Specific Details

### megatronus (Hyprland)

- **Window Manager:** Hyprland (via `programs.hyprland.enable = true;`).
- **Display Manager:** `sddm` (or you can use `greetd` + `hyprland` session).
- **Key Features:**
  - Automatic detection of NVIDIA/AMD/Intel GPU and appropriate drivers.
  - Enable `services.xserver.videoDrivers = [ "nvidia" ]` (or `amdgpu`, `intel`) as needed.
  - Includes `programs.hyprland` with custom keybindings, layout prefs, and a sample `hyprland.conf`.
  - Enables `pipewire`, `wireplumber`, and `pulseaudio` (via `pipewire`).
  - Flatpak support enabled (`programs.flatpak.enable = true;`).
  - Optional gaming stack: `steam`, `lutris`, `gamemode`, `vulkan` drivers.

#### Enabling NVIDIA (example)

In `hosts/megatronus/configuration.nix` you may find:

```nix
services.xserver.videoDrivers = [ "nvidia" ];
services.nvidia.package = pkgs.nvidiaPackages.stable; # or .beta
```

If you have a hybrid GPU, ensure `prime` offloading is configured:

```nix
services.xserver.driSupport32Bit = true;
services.nvidia.prime.offloadEnable = true;
```

### cyclonus (Niri)

- **Window Manager:** Niri (a scratchpad‑aware tiling Wayland compositor).
- **Display Manager:** `greetd` with a `niri` session (or `sddm` if preferred).
- **Key Features:**
  - Minimalist setup focused on keyboard‑driven workflow.
  - Enables `programs.niri` with custom config (keybindings, bar, etc.).
  - Uses `wlroots`‑based compositor; works well with Intel/AMD GPUs.
  - Includes `programs.dunst` for notifications.
  - Configures `networkmanager` for easy Wi‑Fi switching.
  - Enables `tlp` for power‑saving on laptops.

#### Power Management (laptop)

```nix
services.tlp.enable = true;
```

---

## Secrets & Sensitive Data

This repository **does not** store plain‑text secrets. Instead, it relies on:

- **`sops-nix`** or **`agenix`** for encrypted secrets (if you have set them up).  
  Look for a `secrets/` directory (git‑ignored) and corresponding `.sops.yaml` or `age` key files.
- **Environment variables** for services that support them (e.g., `GIT_TOKEN`, `DOCKER_HUB_USERNAME`).
- **Password files** managed by `home-manager` programs like `pass` or `gnome-keyring`.

If you are setting up a fresh machine, you will need to:

1. Generate an age key pair (or GPG) for sops/agenix.
2. Add the public key to `.sops.yaml` (or `agenix` config).
3. Encrypt your secrets with `sops` (`sops --encrypt --in-place secrets/secrets.yaml`).
4. Ensure the `sops.nix` or `agenix` module is imported in the host configuration.

> **Tip:** If you prefer not to use encrypted secrets, you can manually place files in `/etc/nixos/secrets/` (mode 0400) and reference them with `builtins.readFile /etc/nixos/secrets/<file>`.

---

## Updating the System

To pull the latest changes and rebuild:

```bash
# 1. Update the flake lock (fetches latest nixpkgs, etc.)
nix flake update

# 2. Rebuild the host
sudo nixos-rebuild switch --flake .#megatronus   # or cyclonus
```

If you only want to update `nixpkgs` without touching other inputs:

```bash
nix flake lock --update-input nixpkgs
```

---

## Troubleshooting

| Symptom | Likely Cause | Fix |
|---------|--------------|-----|
| **Boot stops at emergency mode** | Misconfigured `fileSystems` or missing hardware config. | Check `journalctl -b -1` for mount errors; verify `hosts/<name>/hardware-configuration.nix` matches current disks. |
| **Hyprland/Niri fails to start** | Missing GPU drivers or `xdg-desktop-portal` backend. | Ensure `services.xserver.videoDrivers` set correctly; install `xdg-desktop-portal-wlr` for Hyprland/Niri. |
| **Wi‑Fi not working** | NetworkManager disabled or missing firmware. | Verify `services.networkmanager.enable = true;` and install appropriate `linuxFirmware` (e.g., `linuxFirmware.iwlwifi`). |
| **Secrets not decrypting** | Missing age/GPG key or incorrect sops config. | Ensure your key is in `$HOME/.config/sops/age/keys.txt` (or GPG keyring) and that the sops module is included. |
| **Home‑manager packages missing** | Home‑manager not rebuilt after changing `users/<username>`. | Run `home-manager switch --flake .#<username>@megatronus` (or the appropriate host). |

Useful logs:

```bash
# System logs
journalctl -xb

# Home-manager logs
home-manager switch --flake .#<username>@megatronus -v
```

---

## Contributing / Customizing

- **Add a new host:** Create a directory under `hosts/newhost/` with `configuration.nix` and (optionally) `hardware-configuration.nix`. Then add an entry in `flake.nix` under `nixosConfigurations`.
- **Modify modules:** Edit files in `modules/`; they are imported via `imports = [ ... ]` in the host configuration.
- **User‑specific tweaks:** Adjust `users/<username>/home.nix` or add new modules under `users/<username>/modules/`.
- **Updating hardware config:** Run `sudo nixos-generate-config --dir /tmp/hwcfg` and copy the generated `hardware-configuration.nix` over the existing one, then commit.

---

## Installation from Scratch (Optional)

If you are installing NixOS fresh and want to use this repo directly:

1. Boot the NixOS installer ISO.
2. Partition your disk (UEFI + ESP recommended).
3. Mount the target partition at `/mnt`.
4. (Optional) Create a swap file or swap partition.
5. Install NixOS with the flake:

   ```bash
   nixos-install --flake github:gwimbly03/nix-config#megatronus   # or cyclonus
   ```

   The installer will prompt for root password, timezone, etc., then copy the flake into `/etc/nixos` and reboot.

6. After first boot, you may need to run `sudo nixos-rebuild switch --flake .#megatronus` to apply any changes you made locally.

---

### Enjoy your reproducible NixOS setup! 🎉

If you have any questions or run into issues, feel free to open an issue on the GitHub repository or drop a message.

--- 

*Last updated: 2026-08-23*
