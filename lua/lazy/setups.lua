require("presence").setup({
	-- General options
	auto_update         = true,                    -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
	neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
	main_image          = "file",                  -- Main image display (either "neovim" or "file")
	-- client_id           = "",    -- Use your own Discord application client id (not recommended)
	log_level           = nil,                     -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout    = 10,                      -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	enable_line_number  = true,                    -- Displays the current line number instead of the current project
	blacklist           = {},                      -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	file_assets         = {},                      -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time           = true,                    -- Show the timer
	buttons             = {
		{ label = "Download",     url = "https://github.com/v-hck/red-nvim" }
	},

	-- Rich Presence text options
	editing_text        = "Editing %s",      -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	file_explorer_text  = "Browsing %s",     -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text        = "Reading %s",      -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	workspace_text      = "Working on %s",   -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)

})

-- vim.lsp.set_log_level("debug")
require("luau-lsp").setup {
	-- types = {
	-- 	definition_files = {
	-- 		["@unc"] = "",
	-- 	},
	-- 	-- documentation_files = { "" },
	-- },
	sourcemap = {
		enabled = false,
		autogenerate = false, -- automatic generation when the server is initialized
	},
}

require("todo-comments").setup {
	signs = true,   -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "",               -- "fg" or "bg" or empty
		keyword = "wide",          -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "fg",              -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true,      -- uses treesitter to match keywords in comments only
		max_line_len = 400,        -- ignore lines longer than this
		exclude = {},              -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of hilight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
		warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
		info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
		hint = { "LspDiagnosticsDefaultHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
}

require('mini.move').setup()
require('mini.pairs').setup()

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local lualine = require('lualine')

-- Условия для отображения
local conditions = {}
conditions.hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- Цвета
local colors = {
	normal  = '#83acff',
	insert  = '#c4e98e',
	visual  = '#c893eb',
	replace = '#f17279',
	command = '#ECBE7B',
	thm     = '#181825',
	magenta = '#7c6f64',
	green   = '#98be65',
}

-- Кэш LSP клиента
local lsp_client_name = "No Active LSP"
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local clients = vim.lsp.get_active_clients({ bufnr = ev.buf })
		if next(clients) ~= nil then
			lsp_client_name = clients[1].name
		else
			lsp_client_name = "No Active LSP"
		end
	end,
})

-- Левая часть
local left = {
	{
		'mode',
		color = function()
			local m = vim.fn.mode()
			local mode_color = colors.thm
			if m == 'n' then
				mode_color = colors.normal
			elseif m == 'i' then
				mode_color = colors.insert
			elseif m == 'v' or m == 'V' then
				mode_color = colors.visual
			elseif m == 'R' then
				mode_color = colors.replace
			elseif m == 'c' then
				mode_color = colors.command
			end
			return { fg = '#000000', bg = mode_color, gui = 'bold' }
		end
	},
	{ 'filename', color = { fg = colors.magenta, bg = 'NONE' } },
	{ 'location', color = { fg = colors.magenta, bg = 'NONE' } },
	{ 'progress', color = { fg = colors.magenta, bg = 'NONE' } },
	{
		'diagnostics',
		sources = { 'nvim_diagnostic' },
		symbols = { error = ' ', warn = ' ', info = ' ' },
		diagnostics_color = {
			color_error = { fg = colors.replace, bg = colors.thm },
			color_warn  = { fg = colors.command, bg = colors.thm },
			color_info  = { fg = colors.normal, bg = colors.thm },
		},
		color = { bg = colors.thm }
	},
}

-- Правая часть
local right = {
	{
		function() return lsp_client_name end,
		icon = "LSP:",
		color = { fg = '#5f87af', gui = 'bold', bg = 'NONE' },
	},
	{ 'o:encoding', fmt = string.upper, cond = conditions.hide_in_width, color = { fg = colors.green, bg = colors.thm, gui = 'bold' } },
	{ 'fileformat', fmt = string.upper, icons_enabled = false, color = { fg = colors.green, bg = colors.thm, gui = 'bold' } },
	{ 'branch', icon = '', color = { fg = colors.visual, bg = colors.thm, gui = 'bold' } },
	{
		'diff',
		symbols = { added = ' ', modified = ' ', removed = ' ' },
		diff_color = {
			added = { fg = colors.green, bg = colors.thm },
			modified = { fg = colors.command, bg = colors.thm },
			removed = { fg = colors.replace, bg = colors.thm },
		},
		cond = conditions.hide_in_width,
	},
}

-- Настройка Lualine
lualine.setup({
	options = {
		theme = 'auto',
		section_separators = '',
		component_separators = '',
		disabled_filetypes = { 'dashboard', 'NvimTree', 'toggleterm' }, -- отключить там, где не нужен
	},
	sections = {
		lualine_a = left,
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = right,
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
})

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { '*' },
			},
		},
	},
	offset_encoding = "utf-8",
}

lspconfig.ts_ls.setup({})

-- Setup Ruff Linter
lspconfig.ruff.setup {
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {
				"--select=E,F,UP,N,I,ASYNC,S,PTH",
				"--line-length=79",
				"--respect-gitignore", -- Исключать из сканирования файлы в .gitignore
				"--target-version=py311"
			},
		}
	},
	offset_encoding = "utf-8",
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

		vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename variable", buffer = ev.buf })
		vim.keymap.set('n', '<leader>cv', vim.lsp.buf.references, { desc = "Variable references", buffer = ev.buf })
		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.declaration, { desc = "Variable declaration", buffer = ev.buf })
		vim.keymap.set('n', '<leader>cf', vim.lsp.buf.definition, { desc = "Variable definition", buffer = ev.buf })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.hover, { desc = "Variable info", buffer = ev.buf })
		vim.keymap.set({ 'n', 'v' }, '<space>cd', vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })
		vim.keymap.set('n', '<space>cw', function() vim.lsp.buf.format{ async = true } end, { desc = "Beautifier", buffer = ev.buf })

		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
	end,
})

local function default_header()
	return {
		'', '', '', '', '', '',
		"██▀███  ▓█████ ▓█████▄     ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓",
		"▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
		"▓██ ░▄█ ▒▒███   ░██   █▌   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░",
		"▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ",
		"░██▓ ▒██▒░▒████▒░▒████▓    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒",
		"░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒    ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░",
		"  ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒    ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░",
		"  ░░   ░    ░    ░ ░  ░       ░   ░ ░     ░░   ▒ ░░      ░   ",
		"   ░        ░  ░   ░                ░      ░   ░         ░   ",
		"                 ░                        ░                  ",
		'', '', ''
	}
end

-- Dashboard Setup
require('dashboard').setup {
	theme = 'doom',
	config = {
		header = default_header(),
		center = {
			{
				icon = '󰈞 ',
				icon_hl = 'Title',
				desc = 'Find files',
				desc_hl = 'String',
				key = 'f',
				keymap = 'SPC f f',
				key_hl = 'Number',
				action = ':Telescope find_files'
			},
			{
				icon = '󰱾 ',
				icon_hl = 'Title',
				desc = 'Open recently',
				desc_hl = 'String',
				key = 'r',
				keymap = 'SPC f r',
				key_hl = 'Number',
				action = ':Telescope oldfiles'
			},
			{
				icon = ' ',
				icon_hl = 'Title',
				desc = 'Find text',
				desc_hl = 'String',
				key = 'w',
				keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Telescope live_grep'
			},
			-- {
			--     icon = ' ',
			--     icon_hl = 'Title',
			--     desc = 'Git Braches',
			--     desc_hl = 'String',
			--     key = 'b',
			--     keymap = 'SPC g b',
			--     key_hl = 'Number',
			--     action = ':Telescope git_branches'
			-- }
		}
	}
}

require('Comment').setup()

require 'colorizer'.setup()

local cmp = require 'cmp'

-- Получаем цвета из темы Catppuccin Mocha
local catppuccin = require('catppuccin.palettes').get_palette("mocha")

-- Используем цвет для рамки из Catppuccin Mocha
local border_color = catppuccin.blue -- или catppuccin.lavender если хочешь другой оттенок

-- Snippet configuration
cmp.setup({
	snippet = {
		expand = function(args)
			-- Вставка сниппетов (разкомментируй нужный движок)
			-- vim.fn["vsnip#anonymous"](args.body)
			-- require('luasnip').lsp_expand(args.body)
			-- require('snippy').expand_snippet(args.body)
			-- vim.fn["UltiSnips#Anon"](args.body)
		end
	},

	-- Window appearance with border
	window = {
		completion = cmp.config.window.bordered({
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Рамка для completion
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Рамка для documentation
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None",
		}),
	},

	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr .. " " -- добавляем пробел справа у текста
			return vim_item
		end,
	},

	-- Key mappings
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" })
	}),

	-- Completion sources
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' } -- Для vsnip пользователей
	}, {
		{ name = 'buffer' },
		{ name = 'nvim_lsp_signature_help' }
	})
})

-- Filetype specific configuration
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' } -- Только для gitcommit
	}, {
		{ name = 'buffer' }
	})
})

-- Cmdline configuration
-- Для поиска через / и ?
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } }
})

-- Для команд через :
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- LSP capabilities setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['ts_ls'].setup { capabilities = capabilities }

-- Highlight for border colors using Catppuccin Mocha color
vim.cmd('highlight CmpBorder guifg=' .. border_color)
vim.cmd('highlight CmpDocBorder guifg=' .. border_color)

local config = {
	fps = 50,
	name = 'slide',
}

-- update function
config.update = function(grid)
	for i = 1, #grid do
		local prev = grid[i][#(grid[i])]
		for j = 1, #(grid[i]) do
			grid[i][j], prev = prev, grid[i][j]
		end
	end
	return true
end

require("cellular-automaton").register_animation(config)
