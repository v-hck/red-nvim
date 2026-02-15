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
sudo mkdir -p ~/.config/nvim
git clone https://github.com/v-hck/red-nvim ~/.config/nvim
sudo mv ~/.config/nvim/red.vim /usr/share/nvim/runtime/colors/red.vim
nvim -c "MasonInstall actionlint basedpyright cfn-lint circleci-yaml-language-server emmylua-codeformat hyprls lemmy-help local-lua-debugger-vscode lua-language-server luacheck luau-lsp lwc-language-server pyright ruff vim-language-server vint"
```
## Post Installation
```sh
mv ~/.config/nvim/luau1.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/configurations/luau.lua
mv ~/.config/nvim/luau2.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/locators/luau.lua
```
## Plugins
- ale
- bufferline.nvim
- catppuccin
- cellular-automaton.nvim
- cmp-buffer
- cmp-cmdline
- cmp-nvim-lsp
- cmp-path
- codestats.nvim
- Comment.nvim
- dashboard-nvim
- gitsigns.nvim
- gruvbox.nvim
- lazy.nvim
- lualine.nvim
- luarocks.nvim
- luau-lsp.nvim
- mason.nvim
- mini.move
- mini.nvim
- mini.pairs
- nvim-cmp
- nvim-colorizer.lua
- nvim-lspconfig
- nvim-tree.lua
- nvim-treesitter
- nvim-ufo
- nvim-web-devicons
- plenary.nvim
- presence.nvim
- promise-async
- suda.nvim
- telescope.nvim
- todo-comments.nvim
- toggleterm.nvim
- trouble.nvim
- vim-illuminate
- which-key.nvim
