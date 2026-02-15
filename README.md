<p align="center">
A minimalistic nvim config aimed at Python developers. It is a lightweight replacement for PyCharm and VsCode, eliminating all unnecessary featuresd to be easily portable for running on servers and for deployment on Linux systems.
I created this fork to remove these errors https://github.com/Zproger/GenesisNvim/pull/19 and make it convenient for me. And thanks to Zproger for the great work
</p>

## Preview
![image](images/1.png)
![image](images/2.png)
![image](images/3.png)
![image](images/4.png)

## Installation
- If you already have neovim, make backups of your configuration.
```sh
sudo dnf in neovim lazygit
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
mkdir -p ~/.config/nvim
git clone https://github.com/v-hck/red-nvim ~/.config/nvim
nvim -c "MasonInstall actionlint basedpyright cfn-lint circleci-yaml-language-server emmylua-codeformat hyprls lemmy-help local-lua-debugger-vscode lua-language-server luacheck luau-lsp lwc-language-server pyright ruff vim-language-server vint"
```
## Post Installation
```sh
mv luau1.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/configurations/luau.lua
mv luau2.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/locators/luau.lua
```
