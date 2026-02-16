return {
	'kevinhwang91/nvim-ufo',
	dependencies = { 'kevinhwang91/promise-async' }, -- обязательная зависимость
	version = false,                              -- стабильный мастер, без тегов
	event = { 'BufReadPost', 'BufNewFile' },      -- загружать при открытии файла
	keys = {
		-- Глобальные переопределения стандартных команд zR/zM через <leader>z
		{ '<leader>zE', function() require('ufo').openAllFolds() end,         desc = 'Open all folds' },
		{ '<leader>zQ', function() require('ufo').closeAllFolds() end,        desc = 'Close all folds' },
		-- Открыть/закрыть все кроме указанных видов (kinds)
		{ '<leader>ze', function() require('ufo').openFoldsExceptKinds() end, desc = 'Open folds except kinds' },
		{ '<leader>zq', function() require('ufo').closeFoldsWith() end,       desc = 'Close folds with level' }, -- closeAllFolds == closeFoldsWith(0)
		-- Показать сложенные строки под курсором (peek)
		{
			'<leader>zw',
			desc = 'Peek folded lines',
			function()
				local ufo = require('ufo')
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					-- fallback: показать hover от LSP, если нет свёрнутых строк
					vim.lsp.buf.hover()
				end
			end,
		},
		-- Пользовательские бинды для точного управления уровнями фолда
		{ '<leader>z1', function() require('ufo').closeFoldsWith(1) end, desc = 'Close folds with level 1' },
		{ '<leader>z2', function() require('ufo').closeFoldsWith(2) end, desc = 'Close folds with level 2' },
		{ '<leader>z3', function() require('ufo').closeFoldsWith(3) end, desc = 'Close folds with level 3' },
		{ '<leader>z4', function() require('ufo').closeFoldsWith(4) end, desc = 'Close folds with level 4' },
		{ '<leader>z`', function() require('ufo').closeFoldsWith(0) end, desc = 'Close all folds (level 0)' },
		-- Команды плагина (выполняются через :)
		{ '<leader>zT', ':UfoEnable<CR>',                                desc = 'Enable UFO' },
		{ '<leader>zD', ':UfoDisable<CR>',                               desc = 'Disable UFO' },
		{ '<leader>zz', ':UfoInspect<CR>',                               desc = 'Inspect UFO info' },
		{ '<leader>za', ':UfoAttach<CR>',                                desc = 'Attach UFO to buffer' },
		{ '<leader>zd', ':UfoDetach<CR>',                                desc = 'Detach UFO from buffer' },
	},
	opts = {
		-- Время подсветки при открытии фолда (мс) – 0 отключает
		open_fold_hl_timeout = 400, -- default: 400

		-- Выбор провайдеров фолда: lsp, treesitter, indent
		-- По умолчанию: lsp (основной) + indent (fallback)
		provider_selector = function(bufnr, filetype, buftype)
			-- Для gitcommit используем только indent, для остальных lsp+indent
			-- if filetype == 'gitcommit' then
			-- 	return { 'indent' }
			-- end
			-- Для файлов без LSP клиента можно включить treesitter
			-- if vim.tbl_isempty(vim.lsp.get_clients({ bufnr = bufnr })) then
			--   return { 'treesitter', 'indent' }
			-- end
			return { 'indent', 'lsp' }
		end,

		-- Какие виды фолдов автоматически закрывать при открытии буфера
		close_fold_kinds_for_ft = {
			default = { 'imports', 'comment' }, -- закрыть импорты и комментарии
			lua = { 'comment' },       -- в lua только комментарии
			python = { 'imports', 'comment', 'strings' },
			c = { 'comment', 'region' },
			cpp = { 'comment', 'region' },
			json = { 'array' },
		},

		-- Закрывать фолд на текущей строке при первом открытии буфера?
		close_fold_current_line_for_ft = {
			default = false,
			-- можно включить для конкретных типов:
			-- python = true,
		},

		-- Кастомный обработчик текста фолда (если нужно число строк)
		-- если nil — используется стандартный эллипсис
		fold_virt_text_handler = nil, -- см. пример в документации

		-- Разрешить получение виртуального текста для кастомной обработки
		enable_get_fold_virt_text = false,

		-- Переопределить стандартный foldtext (рекомендуется true)
		override_foldtext = true,

		-- Настройки окна предпросмотра (peek)
		preview = {
			win_config = {
				border = 'rounded', -- стиль границы
				winblend = 12,      -- прозрачность 0-100
				winhighlight = 'Normal:Normal', -- цвета
				maxheight = 20,     -- макс. высота окна
			},
			mappings = {
				-- Переназначение клавиш внутри окна предпросмотра
				scrollU = '<C-u>', -- скролл вверх
				scrollD = '<C-d>', -- скролл вниз
				jumpTop = '[', -- переход к началу
				jumpBot = ']', -- переход к концу
				close = 'q', -- закрыть окно
				switch = '<Tab>', -- переключение окон
				trace = '<CR>', -- трассировка кода
			},
		},
	},
	init = function()
		-- Обязательные настройки Neovim для работы UFO
		vim.o.foldcolumn = '1' -- показать колонку фолдов
		vim.o.foldlevel = 99 -- большое значение для ручного режима
		vim.o.foldlevelstart = 99 -- при старте все открыто
		vim.o.foldenable = true -- включить фолды
		-- Форматирование линий свертывания (символы)
	end,
}
