<!-- Aesthetic badges for Unixporn cred: NixOS, Neovim, and a custom Unixporn-ready badge -->
<p align="center">
  <img src="https://img.shields.io/badge/NixOS-5277C3?style=flat-square&logo=nixos&logoColor=white" alt="NixOS Badge">
  <img src="https://img.shields.io/badge/Neovim-57A143?style=flat-square&logo=neovim&logoColor=white" alt="Neovim Badge">
  <img src="https://img.shields.io/badge/Unixporn-Ready-FF6F61?style=flat-square" alt="Unixporn Ready">
</p>

<!-- Main title with a wave emoji for a fluid, calming vibe—perfect for ricers -->
<h1 align="center">🌊 NixVim Config</h1>
<p align="center">
  <!-- Italicized tagline sets the tone: sleek and modern -->
  <i>A standalone NixVim module crafted for the ultimate Neovim experience</i>
</p>

<!-- Horizontal rule for clean section separation -->
---

<!-- Centered preview images with adjusted widths for balanced layout -->
<p align="center">
  <img src="https://github.com/SpitfireGG/nixvim/raw/main/preview/home.png" alt="Home Preview" width="45%">
  <img src="https://github.com/SpitfireGG/nixvim/raw/main/preview/cmp.png" alt="Completion Preview" width="45%">
  <br>
  <img src="https://github.com/SpitfireGG/nixvim/raw/main/preview/term.png" alt="Terminal Preview" width="60%">
</p>

<!-- Bolded Unixporn-inspired tagline with sparkle emojis -->
<p align="center">
  <b>✨ Sleek. Minimal. Riced to Perfection. ✨</b>
</p>

<!-- Section separator -->
---

## 🚀 Installation

<!-- Clear options for setup: one-liner for simplicity, manual for control -->
### One-Liner
```bash
nix run 'github:spitfiregg/nixvim'



Plug and play—straight from the cloud.

Manual Setup
Clone or Copy: Grab this repo into an empty directory:
bash
Wrap
Copy
git clone https://github.com/SpitfireGG/nixvim.git && cd nixvim
Update and Build: Lock dependencies and build the derivation:
bash
Wrap
Copy
nix flake update && nix build .#packages.x86_64-linux.default
Test It: Fire up NixVim:
bash
Wrap
Copy
./result/bin/nvim
Make It Permanent: Keep it handy with an alias or symlink:
Alias: alias nvim='~/path/to/nixvim/result/bin/nvim' (add to ~/.bashrc or equivalent)
Symlink: ln -s ./result/bin/nvim ~/.local/bin/nvim
<!-- Pro tip in a blockquote for that ricer flair -->
Pro Tip: The derivation lands in result/bin/. Tweak your shell to make it your daily driver!

<!-- Section separator -->
🎨 Features
<!-- Bullet list with emojis for visual pop and Unixporn appeal -->
🌍 Flake-Powered: Reproducible, pure Nix goodness.
🖼️ Unixporn-Ready: Eye-candy colorschemes and layouts.
🛠️ Modular Design: Standalone config—mix it into your Nix setup or run solo.
⚡ Performance: Lightweight yet packed with modern Neovim flair.
<!-- Section separator -->
🙌 Credits
<!-- Simple, heartfelt nod to the community -->
Big props to the original wizards behind the config and those dreamy colorschemes. This is a love letter to the Nix and Neovim communities!

<!-- Final separator -->
<!-- Closing tagline with a cosmic vibe --> <p align="center"> <b>🌌 Dive into the NixVim wave—your terminal deserves it.</b> </p> ```
