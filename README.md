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
sudo mv luau1.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/configurations/luau.lua
sudo mv luau2.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/locators/luau.lua
sudo mv red.vim usr/share/nvim/runtime/colors/red.vim
```
