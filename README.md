# 🚀 RootApp NixOS Flake

A pure, zero-maintenance NixOS flake for installing and running **RootApp**. 

## ✨ Features
* **Completely Pure:** No mutable files in `/var/lib/` or background downloads on your local machine.
* **Desktop Integration:** Automatically extracts the official logo and installs a fully functional `.desktop` entry for GNOME/KDE/etc.

---

## 📦 How to Add it to your NixOS System

### 1. Add the Input
Open your system's `flake.nix` and add this repository to your `inputs` block:

```nix
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Add the RootApp Flake
    rootapp-flake = {
      url = "github:Ackerman-00/rootapp-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
