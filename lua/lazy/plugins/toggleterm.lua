return {
	'akinsho/toggleterm.nvim',
	version = "*",
	event = "VeryLazy",
	-- Конфигурация плагина
	opts = {
		size = 20,                      -- Размер терминала по умолчанию
		hide_numbers = true,            -- Скрыть номера в буфере терминала
		shade_filetypes = {},
		autochdir = true,              -- Терминал не меняет директорию вслед за nvim
		start_in_insert = true,         -- Начинать в режиме вставки
		insert_mappings = false,        -- Отключить маппинги плагина в insert mode (будем свои ставить через keys)
		terminal_mappings = false,      -- Отключить маппинги плагина в terminal mode (будем свои ставить через keys)
		persist_size = true,            -- Сохранять размер терминала между сессиями
		persist_mode = true,            -- Сохранять режим (открыт/закрыт) терминала
		direction = 'float',            -- Направление открытия: 'vertical' | 'horizontal' | 'tab' | 'float'
		close_on_exit = false,           -- Закрывать окно терминала при выходе из процесса
		shell = "zsh",                    -- Использовать shell по умолчанию из vim.o.shell
		auto_scroll = true,             -- Автопрокрутка к новому выводу

		-- Настройки для плавающего (float) окна
		float_opts = {
			border = 'curved',            -- Стиль рамки: 'single', 'double', 'shadow', 'curved' или другие
			winblend = 3,                 -- Прозрачность окна (0-100)
			zindex = 1000,                -- Уровень слоя окна
			title_pos = 'center',           -- Позиция заголовка: 'left', 'center', 'right'
		},

		-- Настройки подсветки (можно настроить под свою цветовую схему)
		highlights = {
			NormalFloat = {
				link = 'Normal'
			},
			FloatBorder = {
				guifg = "#ff0000",
				guibg = "NONE",
			},
		},
		shade_terminals = true,         -- Затемнять терминальные окна (если false, использует highlights)
	},
	-- Клавиши для управления плагином
	keys = {
		-- Основное переключение терминала
		{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle last terminal", mode = "n" },

		-- Переключение конкретных терминалов (можно вызвать с числовым префиксом, например 2<leader>t1)
		{ "<leader>t1", "<cmd>1ToggleTerm<CR>", desc = "Toggle terminal 1", mode = "n" },
		{ "<leader>t2", "<cmd>2ToggleTerm<CR>", desc = "Toggle terminal 2", mode = "n" },
		{ "<leader>t3", "<cmd>3ToggleTerm<CR>", desc = "Toggle terminal 3", mode = "n" },

		-- Создание нового терминала
		{ "<leader>tn", "<cmd>TermNew<CR>", desc = "New terminal", mode = "n" },

		-- Выбор терминала из списка
		{ "<leader>ts", "<cmd>TermSelect<CR>", desc = "Select terminal", mode = "n" },

		-- Открыть/закрыть все терминалы
		{ "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals", mode = "n" },

		-- Установить имя для текущего терминала
		{ "<leader>tN", "<cmd>ToggleTermSetName<CR>", desc = "Set terminal name", mode = "n" },

		-- Управление направлением открытия (удобно менять на лету)
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle float terminal", mode = "n" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal", mode = "n" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle vertical terminal", mode = "n" },

		-- Отправка кода в терминал (очень полезно для REPL)
		-- Отправить текущую строку в терминал №1
		{ "<leader>tl", "<cmd>ToggleTermSendCurrentLine<CR>", desc = "Send current line to terminal", mode = "n" },
		-- Визуальный режим: отправить выделенные строки
		{ "<leader>tl", ":ToggleTermSendVisualLines<CR>", desc = "Send visual lines to terminal", mode = "v" },
		-- Визуальный режим: отправить только выделение (даже если оно в одной строке)
		{ "<leader>ts", ":ToggleTermSendVisualSelection<CR>", desc = "Send visual selection to terminal", mode = "v" },

		-- Выполнить команду в терминале (например, giT status)
		{ "<leader>tc", "<cmd>TermExec<CR>", desc = "Execute command in terminal", mode = "n" },
	},
	config = function(_, opts)
		-- Настройка плагина с переданными опциями
		require("toggleterm").setup(opts)

		-- Дополнительные маппинги для удобной навигации в режиме терминала
		-- Используем <Esc> для выхода из терминального режима (стандартное поведение)
		-- Эти маппинги работают ТОЛЬКО когда курсор находится в окне терминала
		vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
		vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = "Move focus to left window" })
		vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = "Move focus to window below" })
		vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = "Move focus to window above" })
		vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = "Move focus to right window" })

		-- Для persist_mode важно использовать wincmd вместо простого выхода
		-- Это позволяет сохранять состояние терминала между сессиями
		vim.keymap.set('t', '<leader>tt', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "Toggle terminal from terminal mode" })


		vim.keymap.set("n", "<leader>tg", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			lazygit:toggle()
		end, {desc = "Toggle lazygit"})
		
		vim.keymap.set("n", "<leader>tp", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local python = Terminal:new({ cmd = "python", hidden = true })
			python:toggle()
		end, {desc = "Toggle Python"})
	end,
}
