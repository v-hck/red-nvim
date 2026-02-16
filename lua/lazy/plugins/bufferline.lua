return {
	-- Основной плагин: красивая строка буферов
	"akinsho/bufferline.nvim",
	version = "*", -- Используем последний стабильный релиз
	dependencies = "nvim-tree/nvim-web-devicons", -- Иконки для файлов
	event = "VeryLazy", -- Загружаем после старта (но можно и "BufAdd")
	-- Все настройки плагина: детальная конфигурация через opts
	opts = {
		options = {
			-- Номера слева от имени буфера (ordinal = 1, 2, 3...)
			numbers = "ordinal", -- Показывать порядковый номер
			-- Команды для кликов
			close_command = "bdelete! %d", -- Закрыть левой кнопкой по иконке закрытия
			right_mouse_command = "bdelete! %d", -- Закрыть правой кнопкой по любому месту таба
			left_mouse_command = "buffer %d", -- Перейти левой кнопкой
			middle_mouse_command = nil, -- Средняя кнопка не назначена
			-- Визуальные индикаторы
			indicator = {
				icon = "▎", -- Полоска слева от активного буфера
				style = "icon", -- Иконка, не подчёркивание
			},
			-- Иконки (используются nerd‑шрифты)
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			-- Настройки имён
			max_name_length = 18,
			max_prefix_length = 15,
			truncate_names = true,
			tab_size = 18,
			-- Диагностика LSP
			diagnostics = "nvim_lsp", -- Показывать ошибки/предупреждения LSP
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				-- Кастомный индикатор: иконка + число
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			-- Иконки файлов
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- Сохранять порядок между сессиями
			-- Разделители (стиль табов)
			separator_style = "thick", -- Можно "slant", "padded_slant", "slope", "thick"
			enforce_regular_tabs = false,
			always_show_bufferline = true, -- Показывать строку, даже если всего один буфер
			-- Сортировка
			sort_by = "insert_at_end", -- Новые буферы добавляются в конец
			-- Смещение для боковой панели (NvimTree, Neo‑tree и т.п.)
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
				{
					filetype = "neo-tree",
					text = "Neo‑tree",
					text_align = "left",
					separator = true,
				},
			},
		},
	},
	-- Полная карта биндов: все команды буферной строки на <leader>q
	keys = {
		-- Навигация между буферами
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" }, -- следующий буфер
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" }, -- предыдущий буфер
		-- Перемещение буферов
		-- { "<C-Tab>",    "<Cmd>BufferLineMoveNext<CR>",        desc = "Move buffer right" },     -- переместить текущий буфер вправо
		-- { "<C-S-Tab>",  "<Cmd>BufferLineMovePrev<CR>",        desc = "Move buffer left" },      -- переместить текущий буфер влево
		-- Закрытие буферов
		{ "<leader>bx", "<Cmd>BufferLinePickClose<CR>", desc = "Pick buffer to close" }, -- интерактивное закрытие (выбор буквой)
		{ "<leader>bc", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" }, -- закрыть все, кроме текущего
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" }, -- закрыть буферы справа
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" }, -- закрыть буферы слева
		-- Пины (закрепление)
		{ "<leader>bP", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" }, -- закрепить/открепить буфер
		-- Быстрый переход по номерам (если включены numbers = "ordinal")
		{ "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
		{ "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
		{ "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
		{ "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
		{ "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
		{ "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
		{ "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
		{ "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
		{ "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
		-- Группы (если используются)
		{ "<leader>bg", "<Cmd>BufferLineGroup<CR>", desc = "Manage groups" }, -- открыть меню групп (требует настройки групп)
		-- Сортировка (опционально)
		{ "<leader>bd", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" }, -- сортировка по папке
		{ "<leader>be", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" }, -- сортировка по расширению
	},
}
