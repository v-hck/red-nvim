return {
	"lewis6991/gitsigns.nvim",
	version = "*", -- Используйте последнюю стабильную версию
	event = { "BufReadPre", "BufNewFile" }, -- Загрузка при работе с файлами
	opts = {
		-- 1) Настройка значков в колонке знаков (signcolumn)
		signs = {
			add          = { text = '+', numhl = 'GitSignsAdd' }, -- Добавленная строка
			change       = { text = '*', numhl = 'GitSignsChange' }, -- Измененная строка
			delete       = { text = '-', numhl = 'GitSignsDelete' }, -- Удаленная строка
			topdelete    = { text = '‾', numhl = 'GitSignsDelete' }, -- Удаленная сверху
			changedelete = { text = '~', numhl = 'GitSignsChange' }, -- Измененная и удаленная
			untracked    = { text = '┆', numhl = 'GitSignsUntracked' }, -- Неотслеживаемая
		},
		-- 2) Отдельные знаки для проиндексированных (staged) изменений
		signs_staged = {
			add          = { text = '++', numhl = 'GitSignsStagedAdd' },
			change       = { text = '**', numhl = 'GitSignsStagedChange' },
			delete       = { text = '--', numhl = 'GitSignsStagedDelete' },
			topdelete    = { text = '‾', numhl = 'GitSignsStagedDelete' },
			changedelete = { text = '~', numhl = 'GitSignsStagedChange' },
		},
		signs_staged_enable = true, -- Включить отдельные знаки для staged изменений
		signcolumn = true, -- Показывать колонку знаков всегда
		numhl = false, -- Не подсвечивать номера строк
		linehl = false, -- Не подсвечивать всю строку
		word_diff = false, -- Не показывать внутристрочные изменения слов

		-- 3) Отслеживание изменений в Git-репозитории
		watch_gitdir = { interval = 10000, follow_files = true },
		auto_attach = true, -- Автоматически подключаться к буферам в Git-репозитории
		attach_to_untracked = false, -- Не подключаться к неотслеживаемым файлам

		-- 4) Blame для текущей строки (виртуальный текст)
		current_line_blame = false, -- Выключено по умолчанию
		current_line_blame_opts = {
			virt_text = true, -- Показывать как виртуальный текст
			virt_text_pos = 'eol', -- Позиция: в конце строки ('eol'|'overlay'|'right_align')
			delay = 1000, -- Задержка перед показом (мс)
			ignore_whitespace = false, -- Не игнорировать пробелы
			virt_text_priority = 100, -- Приоритет отображения
		},
		current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',

		-- 5) Общие настройки
		sign_priority = 6, -- Приоритет знаков в колонке
		update_debounce = 100, -- Задержка обновления (мс)
		status_formatter = nil, -- Использовать форматтер по умолчанию для статуса
		max_file_length = 40000, -- Не работать с файлами длиннее 40000 строк

		-- 6) Настройки окна предпросмотра
		preview_config = {
			border = 'single', -- Граница окна
			style = 'minimal', -- Стиль окна
			relative = 'cursor', -- Позиция относительно курсора
			row = 0, -- Смещение по вертикали
			col = 1, -- Смещение по горизонтали
		},

		-- 7) Функция, вызываемая при подключении к буферу (здесь настраиваются keymaps)
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- Навигация между блоками изменений (hunks)
			map('n', ']c', function() -- Следующий блок изменений
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gitsigns.nav_hunk('next') end)
			end, 'Jump to next hunk')
			map('n', '[c', function() -- Предыдущий блок изменений
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gitsigns.nav_hunk('prev') end)
			end, 'Jump to previous hunk')

			-- Текстовый объект для блока изменений (для операторов и visual-режима)
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select inner hunk (text object)')
		end,
	},

	-- 8) Глобальные keymaps (не привязанные к буферу) через `keys`
	keys = {
		-- Основные действия с блоками изменений (лидер 'g')
		{ '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', desc = 'Stage current hunk' }, -- Проиндексировать текущий блок
		{ '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Reset current hunk' }, -- Сбросить текущий блок

		-- Действия для выделения в visual-режиме (используют текущее выделение)
		{ '<leader>gs', ':Gitsigns stage_hunk<CR>', mode = 'v', desc = 'Stage selected lines (visual)' },
		{ '<leader>gr', ':Gitsigns reset_hunk<CR>', mode = 'v', desc = 'Reset selected lines (visual)' },

		-- Действия со всем буфером
		{ '<leader>gS', '<cmd>Gitsigns stage_buffer<CR>', desc = 'Stage entire buffer' }, -- Проиндексировать весь буфер
		{ '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>', desc = 'Reset entire buffer' }, -- Сбросить весь буфер

		-- Просмотр изменений
		{ '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', desc = 'Preview hunk in popup' }, -- Показать блок во всплывающем окне
		{ '<leader>gi', '<cmd>Gitsigns preview_hunk_inline<CR>', desc = 'Preview hunk inline' }, -- Показать блок встроенно

		-- Blame
		{ '<leader>gb', '<cmd>Gitsigns blame_line<CR>', desc = 'Show blame for current line' }, -- Показать blame для строки
		{ '<leader>gB', '<cmd>Gitsigns toggle_current_line_blame<CR>', desc = 'Toggle line blame (virtual text)' }, -- Вкл/выкл виртуальный текст blame

		-- Diff
		{ '<leader>gd', '<cmd>Gitsigns diffthis<CR>', desc = 'Diff against index' }, -- Сравнить с индексом
		{ '<leader>gD', '<cmd>Gitsigns diffthis ~<CR>', desc = 'Diff against last commit' }, -- Сравнить с последним коммитом
		{ '<leader>gc', '<cmd>Gitsigns change_base<CR>', desc = 'Change base revision for signs' }, -- Изменить базовую ревизию для знаков

		-- Работа со списками (quickfix/location list)
		{ '<leader>gq', '<cmd>Gitsigns setqflist<CR>', desc = 'Open hunks in quickfix' }, -- Показать блоки в quickfix
		{ '<leader>gQ', '<cmd>Gitsigns setqflist all<CR>', desc = 'Open all repo hunks in quickfix' }, -- Показать все блоки репозитория

		-- Переключение функций
		{ '<leader>gt', '<cmd>Gitsigns toggle_signs<CR>', desc = 'Toggle sign column' }, -- Вкл/выкл колонку знаков
		{ '<leader>gw', '<cmd>Gitsigns toggle_word_diff<CR>', desc = 'Toggle intra-line word diff' }, -- Вкл/выкл внутристрочные изменения слов
		{ '<leader>gn', '<cmd>Gitsigns toggle_numhl<CR>', desc = 'Toggle line number highlight' }, -- Вкл/выкл подсветку номеров строк
		{ '<leader>gl', '<cmd>Gitsigns toggle_linehl<CR>', desc = 'Toggle line highlight' }, -- Вкл/выкл подсветку строк

		-- Показать другую ревизию файла
		{ '<leader>go', '<cmd>Gitsigns show<CR>', desc = 'Show buffer at different revision' },
	},
}
