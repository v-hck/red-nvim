return {

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter' },

	-- LSP
	{ 'neovim/nvim-lspconfig' },

	-- Autocomplete
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'williamboman/mason.nvim' },

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Dashboard
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},

	-- Utilities
	{ 'Eandrju/cellular-automaton.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },

	-- Status line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	-- Colorschemes
	{ 'ellisonleao/gruvbox.nvim', priority = 1000,     config = true,  opts = ... },
	{ 'catppuccin/nvim',          name = "catppuccin", priority = 1000 },

	-- Comment
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},

	-- ALE
	{
		'dense-analysis/ale',
		config = function()
			local g = vim.g
			g.ale_linters = {
				python = { 'mypy' },
				lua = { 'lua_language_server' }
			}
		end
	},

	-- Illuminate
	{ 'RRethy/vim-illuminate' },

	-- Luarocks
	{
		"vhyrro/luarocks.nvim",
		priority = 1001,
		opts = { rocks = { "magick" } },
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}
	},


	-- Mini plugins
	{ 'echasnovski/mini.nvim',  version = false },
	{ 'echasnovski/mini.move',  version = false },
	{ 'echasnovski/mini.pairs', version = false },
	{ 'andweeb/presence.nvim',  lazy = false },
	{ "lopi-py/luau-lsp.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{
		'liljaylj/codestats.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = { 'TextChanged', 'InsertEnter' },
		cmd = { 'CodeStatsXpSend', 'CodeStatsProfileUpdate' },
		config = function()
			require('codestats').setup {
				username = 'vhck',          -- needed to fetch profile data
				base_url = 'https://codestats.net', -- codestats.net base url
				api_key = 'SFMyNTY.ZG1oamF3PT0jI01qWTVOakk9.gnlZpIzLIyBcgjTbYCG07ZUkyFA3SbjzfTELz1s4QmA',
				send_on_exit = true,        -- send xp on nvim exit
				send_on_timer = true,       -- send xp on timer
				timer_interval = 60000,     -- timer interval in milliseconds (minimum 1000ms to prevent DDoSing codestat.net servers)
				curl_timeout = 5,           -- curl request timeout in seconds
			}
		end,
	},

	{
		'masajinobe-ef/suda.nvim',
		config = function()
			require('suda').setup {
				editor = 'nvim', -- или nvim-qt, vim
				use_editor = false, -- true = sudo -e (рекомендую)
				notify = true,
			}           -- автоопределение прав, :w работает
		end,
	}

}
