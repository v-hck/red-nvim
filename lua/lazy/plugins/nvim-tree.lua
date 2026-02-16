return {
	"nvim-tree/nvim-tree.lua",
	version = "*", -- фиксируем мажорную версию
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- опционально: иконки (требуется Nerd Font)
	},
	-- глобальные бинды в normal режиме, все на <leader>w
	keys = {
		{ "<leader>rt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree", mode = "n" }, -- открыть/закрыть
		{ "<leader>rd", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current file", mode = "n" }, -- показать текущий файл
		{ "<leader>rc", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse tree", mode = "n" }, -- свернуть все узлы
		{ "<leader>rf", "<cmd>NvimTreeFocus<CR>", desc = "Focus on tree", mode = "n" }, -- переключить фокус
		{ "<leader>rr", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh tree", mode = "n" }, -- обновить дерево
	},
	opts = {
		-- автоматические действия
		auto_reload_on_write = true, -- перезагружать при записи файла
		create_in_closed_folder = false, -- не создавать файлы в закрытой папке
		hijack_cursor = true, -- синхронизировать курсор с открытым файлом
		hijack_netrw = true, -- перехватывать netrw
		hijack_unnamed_buffer_when_opening = false, -- не перехватывать безымянные буферы
		open_on_tab = false, -- не открывать при создании вкладки
		sort = {
			sorter = "case_sensitive", -- сортировка: чувствительная к регистру
		},
		view = {
			width = 35, -- ширина окна
			side = "left", -- расположение слева
			preserve_window_proportions = true, -- сохранять пропорции окон
			number = true, -- не показывать номера строк
			relativenumber = false, -- не показывать относительные номера
			signcolumn = "yes", -- всегда показывать колонку знаков
		},
		renderer = {
			add_trailing = false, -- не добавлять завершающие слеши
			group_empty = true, -- группировать пустые папки
			highlight_git = false, -- подсвечивать git-статус
			highlight_opened_files = "none", -- не подсвечивать открытые файлы
			root_folder_modifier = ":t", -- показывать только имя корневой папки
			indent_markers = { -- отступы-маркеры
				enable = true, -- выключены (включать только при необходимости)
				icons = {
					corner = "└ ",
					edge = "│ ",
					item = "│ ",
					none = "  ",
				},
			},
			icons = {
				show = {
					file = true, -- показывать иконки файлов
					folder = true, -- показывать иконки папок
					folder_arrow = true, -- показывать стрелки у папок
					git = true, -- показывать git-иконки
				},
				-- глифы оставлены по умолчанию, подхватятся из nvim-web-devicons
			},
		},
		filters = {
			dotfiles = true, -- скрывать dot-файлы (можно переключить `I`)
			custom = {}, -- пользовательские фильтры
			exclude = {}, -- исключения из фильтров
		},
		git = {
			enable = true, -- включить git-интеграцию
			ignore = false, -- игнорировать файлы из .gitignore
			timeout = 400, -- таймаут запросов к git (мс)
		},
		diagnostics = {
			enable = true, -- показывать диагностики LSP
			show_on_dirs = false, -- не показывать на папках
			show_on_open_dirs = true, -- показывать на открытых папках
			debounce_delay = 50, -- задержка обновления (мс)
			icons = {
				hint = "", -- иконка подсказки
				info = "", -- иконка информации
				warning = "", -- иконка предупреждения
				error = "", -- иконка ошибки
			},
		},
		update_focused_file = {
			enable = true, -- синхронизировать с текущим буфером
			update_cwd = true, -- обновлять cwd при смене корня
			ignore_list = {}, -- список игнорируемых файлов
		},
		ui = {
			confirm = {
				remove = true,
				trash = false,
				default_yes = false,
			},
		},
		actions = {
			open_file = {
				quit_on_open = false, -- не закрывать дерево при открытии файла
				resize_window = true, -- подгонять размер окна
				window_picker = {
					enable = true, -- показывать выбор окна
				},
			},
		},
	},
}
