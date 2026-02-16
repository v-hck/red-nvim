return {
	"dense-analysis/ale",                -- GitHub repo
	version = false,                     -- always use latest
	event = { "BufReadPre", "BufNewFile" }, -- load when opening a file
	-- All configuration is passed in the `opts` table which is merged with defaults
	opts = {
		-- === Core Linting Behavior ===
		-- Delay linting after keystrokes (in ms)
		lint_delay = 200, -- wait 200ms after typing before linting
		-- Only run linters explicitly defined in g:ale_linters
		-- linters_explicit = 3,                                       -- do not run all possible linters
		-- Define which linters to run for specific filetypes
		-- An empty list here means "use the default ALE linters" for that filetype.
		-- To restrict to specific linters, list them, e.g., javascript = { 'eslint' }
		linters = {
			python = { "ruff", "flakeheaven", "basedpyright" },
			lua = { "lua-language-server", "luacheck" },
			luau = { "luau-language-server", "selene" },
			vim = { "vint", "vim-language-server" },
			yaml = { "actionlint", "circleci-yaml-language-server" },
			hyrp = { "hyprls" },
			javascript = { "biome" },
			typescript = { "biome" },
			json = { "biome" },
		},         -- use default linters for all filetypes
		-- Set this to fix files when you save them
		fix_on_save = 0, -- run :ALEFix on buffer write
		-- Define fixers for filetypes (run by :ALEFix and fix_on_save)
		fixers = {
			["*"] = { "remove_trailing_lines", "trim_whitespace" }, -- global fixers for all files
			lua = { "stylua" },                            -- example for Lua
			luau = { "stylua" },                           -- example for Lua
			python = { "ruff" },                           -- example for Python
			javascript = { "biome" },
			typescript = { "biome" },
			json = { "biome" },
		},
		-- === Signs (Gutter) ===
		sign_column_always = 1, -- keep sign column open to avoid shifting
		sign_error = "✘", -- symbol for errors
		sign_warning = "⚠", -- symbol for warnings
		sign_info = "ℹ", -- symbol for info
		sign_style = "bold", -- style for signs
		-- === Virtual Text (Inline Diagnostics) ===
		-- Show virtual text only for the line the cursor is on
		virtualtext_cursor = "current", -- 'current' or 'disabled'
		-- === Completion (Native LSP-like) ===
		completion_enabled = 1,   -- enable ALE's own completion support
		-- === Hover Information ===
		hover_to_floating_preview = 1, -- show hover info in a floating window
		hover_cursor = 0,         -- do NOT show hover on cursor hold (use keybind)
		-- === LSP Integration (Neovim 0.8+) ===
		-- ALE will integrate with Neovim's native LSP client for features like goto definition
		use_neovim_diagnostics_api = 1, -- use vim.diagnostics for display
		-- === Miscellaneous ===
		warn_about_trailing_whitespace = 0, -- disable trailing whitespace warnings
		echo_delay = 10,              -- delay for echo messages
	},
	-- Define key mappings using the `keys` property for lazy loading on key press
	-- All mappings are in normal mode with <leader>a as the prefix
	keys = {
		-- Navigation and Definition
	},
	-- The `init` function runs before the plugin loads. Good for setting global variables
	-- that ALE checks during its own setup. This complements the `opts` approach.
	init = function()
		-- If you need to set any variables that ALE reads *during its own initialization*,
		-- you can set them here. Most settings in `opts` will be applied by ALE's internal
		-- handling of g:ale# Those that need to be set early can be placed here.
		-- For example, to change how ALE processes its own configuration:
		vim.g.ale_set_highlights = 1  -- enable highlights (default)
		vim.g.ale_set_signs = 1       -- enable signs (default)
		vim.g.ale_set_quickfix = 0    -- do NOT use quickfix (prefer loclist)
		vim.g.ale_set_loclist = 1     -- use location list for errors
		vim.g.ale_open_list = 0       -- do not auto-open location list
		vim.g.ale_keep_list_window_open = 0 -- close loclist if no errors
	end,
}
