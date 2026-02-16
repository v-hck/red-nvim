return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Загружается при открытии файла
	-- dependencies = { 'saghen/blink.cmp' }, -- Раскомментируйте, если используете автодополнение
	opts = {
		-- Серверы, которые нужно включить (из :help lspconfig-all)
		-- Добавляйте сюда названия серверов, которые вы установили
		-- servers = {
		-- 	'lua_ls',  -- Lua
		-- 	'ts_ls',   -- JavaScript/TypeScript (или 'vtsls')
		-- 	'pyright', -- Python
		-- 	'rust_analyzer', -- Rust
		-- 	'gopls',   -- Go
		-- 	-- и так далее...
		-- },
		-- Глобальные настройки для ВСЕХ серверов (опционально)
		settings = {
			-- Пример для Lua
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true), -- FIX: idk why it dont work
					checkThirdParty = false,
				},
				diagnostics = {
					globals = {
						"vim",
					},
				},
				telemetry = { enable = false },
			},
		},
	},
	config = function(_, opts)
		-- 1. Базовая настройка диагностики
		vim.diagnostic.config({
			virtual_text = true, -- Показывать диагностику как виртуальный текст
			signs = true, -- Показывать значки на полях
			underline = true, -- Подчёркивать проблемные места
			update_in_insert = false, -- Не обновлять во время вставки
			severity_sort = true, -- Сортировать по серьёзности
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = true, -- Показывать источник диагностики
				header = "",
				prefix = "",
			},
		}) -- комментарий: настройка отображения ошибок и предупреждений

		-- 2. Включение серверов из opts.servers через новый API
		if opts.servers then
			for _, server in ipairs(opts.servers) do
				-- Для каждого сервера можно задать специфичные настройки, если они есть в opts.settings[server]
				local server_opts = opts.settings and opts.settings[server] or {}
				vim.lsp.config(server, server_opts) -- комментарий: регистрация конфига сервера
				vim.lsp.enable(server) -- комментарий: включение сервера для его filetypes
			end
		end

		-- 3. Настройка обработчика для автоматического завершения (если не используется отдельный плагин)
		-- Если у вас есть плагин для автодополнения (например, blink.cmp, nvim-cmp), закомментируйте или удалите эту секцию
		-- vim.api.nvim_create_autocmd('LspAttach', {
		--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		--   callback = function(ev)
		--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
		--     if client and client.server_capabilities.completionProvider then
		--       vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' -- комментарий: базовое завершение через Ctrl+X Ctrl+O
		--     end
		--   end,
		-- })
	end,
}
