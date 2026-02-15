return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- опционально для иконок
	event = "VeryLazy",                               -- ленивая загрузка
	opts = {
		auto_close = false,                             -- автоматически закрывать, когда нет элементов
		auto_open = false,                              -- автоматически открывать при наличии элементов
		auto_preview = true,                            -- автоматический предпросмотр элементов
		auto_refresh = true,                            -- автоматическое обновление при открытии
		auto_jump = false,                              -- автоматический переход при одном элементе
		focus = true,                                  -- не фокусировать окно при открытии
		restore = true,                                 -- восстанавливать последнюю позицию в списке
		follow = true,                                  -- следовать текущему элементу
		indent_guides = true,                           -- показывать направляющие отступов
		max_items = 200,                                -- лимит элементов на секцию
		multiline = true,                               -- многострочные сообщения
		pinned = false,                                 -- привязка к текущему буферу
		warn_no_results = true,                         -- предупреждение при отсутствии результатов
		open_no_results = false,                        -- открывать окно при отсутствии результатов
		win = {
			type = "split",                               -- тип окна: split или float
			position = "bottom",                          -- позиция окна
			size = 7,                                    -- размер окна
			relative = "editor",                          -- относительное позиционирование
		},
		preview = {
			type = "main",                                -- предпросмотр в основном окне
			scratch = true,                               -- использовать скретч-буфер для предпросмотра
		},
		throttle = {
			refresh = 20,                                 -- троттлинг обновления данных
			update = 10,                                  -- троттлинг обновления окна
			render = 10,                                  -- троттлинг рендеринга
			follow = 100,                                 -- троттлинг следования
			preview = { ms = 100, debounce = true },      -- троттлинг предпросмотра
		},
		keys = {                                        -- бинды внутри окна Trouble
			["?"] = "help",                               -- справка
			r = "refresh",                                -- обновить
			R = "toggle_refresh",                         -- переключить автообновление
			q = "close",                                  -- закрыть
			o = "jump_close",                             -- перейти и закрыть
			["<esc>"] = "cancel",                         -- отмена
			["<cr>"] = "jump",                            -- перейти к элементу
			["<2-leftmouse>"] = "jump",                   -- двойной клик для перехода
			["<c-s>"] = "jump_split",                     -- перейти в горизонтальном разделении
			["<c-v>"] = "jump_vsplit",                    -- перейти в вертикальном разделении
			["}"] = "next",                               -- следующий элемент
			["]]"] = "next",                              -- следующий элемент (альтернатива)
			["{"] = "prev",                               -- предыдущий элемент
			["[["] = "prev",                              -- предыдущий элемент (альтернатива)
			dd = "delete",                                -- удалить элемент
			d = { action = "delete", mode = "v" },        -- удалить в визуальном режиме
			i = "inspect",                                -- инспектировать элемент
			p = "preview",                                -- предпросмотр
			P = "toggle_preview",                         -- переключить предпросмотр
			zo = "fold_open",                             -- открыть свертку
			zO = "fold_open_recursive",                   -- открыть свертку рекурсивно
			zc = "fold_close",                            -- закрыть свертку
			zC = "fold_close_recursive",                  -- закрыть свертку рекурсивно
			za = "fold_toggle",                           -- переключить свертку
			zA = "fold_toggle_recursive",                 -- переключить свертку рекурсивно
			zm = "fold_more",                             -- свернуть больше
			zM = "fold_close_all",                        -- закрыть все свертки
			zr = "fold_reduce",                           -- развернуть больше
			zR = "fold_open_all",                         -- открыть все свертки
			zx = "fold_update",                           -- обновить свертки
			zX = "fold_update_all",                       -- обновить все свертки
			zn = "fold_disable",                          -- отключить свертки
			zN = "fold_enable",                           -- включить свертки
			zi = "fold_toggle_enable",                    -- переключить состояние сверток
			gb = {                                        -- фильтр по текущему буферу
				action = function(view)
					view:filter({ buf = 0 }, { toggle = true })
				end,
				desc = "Toggle Current Buffer Filter",
			},
			s = {                                         -- фильтр по серьезности
				action = function(view)
					local f = view:get_filter("severity")
					local severity = ((f and f.filter.severity or 0) + 1) % 5
					view:filter({ severity = severity }, {
						id = "severity",
						template = "{hl:Title}Filter:{hl} {severity}",
						del = severity == 0,
					})
				end,
				desc = "Toggle Severity Filter",
			},
		},
		modes = {                                       -- пользовательские режимы
			lsp_references = {
				params = {
					include_declaration = true,               -- включать объявления
				},
			},
			lsp_base = {
				params = {
					include_current = false,                  -- не включать текущую позицию
				},
			},
			symbols = {                                   -- пользовательские символы документа
				desc = "document symbols",
				mode = "lsp_document_symbols",
				focus = false,
				win = { position = "left" },
				filter = {
					["not"] = { ft = "lua", kind = "Package" },
					any = {
						ft = { "help", "markdown" },
						kind = {
							"Class", "Constructor", "Enum", "Field", "Function",
							"Interface", "Method", "Module", "Namespace", "Package",
							"Property", "Struct", "Trait",
						},
					},
				},
			},
		},
		icons = {                                       -- настройки иконок
			indent = {
				top = "│ ",                                 -- верхний отступ
				middle = "├╴",                              -- средний отступ
				last = "└╴",                                -- последний отступ
				fold_open = " ",                           -- открытая свертка
				fold_closed = " ",                         -- закрытая свертка
				ws = "  ",                                  -- пробелы
			},
			folder_closed = " ",                         -- закрытая папка
			folder_open = " ",                           -- открытая папка
			kinds = {                                     -- иконки для типов LSP
				Array = " ",
				Boolean = "󰨙 ",
				Class = " ",
				Constant = "󰏿 ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Function = "󰊕 ",
				Interface = " ",
				Key = " ",
				Method = "󰊕 ",
				Module = " ",
				Namespace = "󰦮 ",
				Null = " ",
				Number = "󰎠 ",
				Object = " ",
				Operator = " ",
				Package = " ",
				Property = " ",
				String = " ",
				Struct = "󰆼 ",
				TypeParameter = " ",
				Variable = "󰀫 ",
			},
		},
	},
	keys = {                                          -- глобальные бинды с лидером x
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", mode = "n", desc = "Toggle diagnostics" }, -- переключить диагностику
		{ "<leader>xa", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", mode = "n", desc = "Toggle buffer diagnostics" }, -- диагностика буфера
		-- { "<leader>xl", "<cmd>Trouble lsp toggle<cr>", mode = "n", desc = "Toggle LSP references/definitions" }, -- LSP ссылки/определения
		-- { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", mode = "n", desc = "Toggle document symbols" }, -- символы документа
		{ "<leader>xd", "<cmd>Trouble lsp_document_symbols toggle<cr>", mode = "n", desc = "Toggle LSP document symbols" }, -- LSP символы документа
		-- { "<leader>xc", "<cmd>Trouble lsp_incoming_calls toggle<cr>", mode = "n", desc = "Toggle LSP incoming calls" }, -- входящие вызовы LSP
		-- { "<leader>xo", "<cmd>Trouble lsp_outgoing_calls toggle<cr>", mode = "n", desc = "Toggle LSP outgoing calls" }, -- исходящие вызовы LSP
		-- { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", mode = "n", desc = "Toggle location list" }, -- список локаций
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", mode = "n", desc = "Toggle quickfix list" }, -- quickfix список
		-- { "<leader>xt", "<cmd>Trouble telescope toggle<cr>", mode = "n", desc = "Toggle telescope results" }, -- результаты telescope
		-- { "<leader>xf", "<cmd>Trouble fzf toggle<cr>", mode = "n", desc = "Toggle fzf-lua results" }, -- результаты fzf-lua
		-- { "<leader>xr", "<cmd>Trouble refresh<cr>", mode = "n", desc = "Refresh trouble window" }, -- обновить окно trouble
		-- { "<leader>xq", "<cmd>Trouble close<cr>", mode = "n", desc = "Close trouble window" }, -- закрыть окно trouble
	},
}
