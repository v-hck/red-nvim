## Preview
![image](images/1.png)
![image](images/2.png)
![image](images/3.png)
![image](images/4.png)
## Tips
- press `spece w a` to see all binds
- press `ctrl a` to select all text in file
- press `ctrl s` to save file
- press `ctrl q` to quit
- u can change colorscheme in `~/.config/nvim/lua/kernel/configs.lua`
## Installation
- If you already have neovim, make backups of your configuration.
```sh
sudo dnf install neovim lazygit
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
mkdir -p ~/.config/nvim
git clone https://github.com/v-hck/red-nvim ~/.config/nvim
cp ~/.config/nvim/lua/lazy/editme/presence_default.lua ~/.config/nvim/lua/lazy/editme/presence.lua
cp ~/.config/nvim/lua/lazy/editme/codestats_default.lua ~/.config/nvim/lua/lazy/editme/codestats.lua
sudo mv ~/.config/nvim/red.vim /usr/share/nvim/runtime/colors/red.vim
nvim ~/.config/nvim/lua/lazy/editme -c "MasonInstall actionlint basedpyright circleci-yaml-language-server flakeheaven hyprls lua-language-server luacheck luau-lsp pyright ruff selene stylua vim-language-server vint"
```
## Post Installation
```sh
cp ~/.config/nvim/luau1.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/configurations/luau.lua
cp ~/.config/nvim/luau2.lua ~/.local/share/nvim/lazy/neogen/lua/neogen/locators/luau.lua
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
