vim.cmd.colorscheme("red")

vim.api.nvim_buf_set_option(0, "modifiable", true)

-- Basic Settings
vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.undolevels = 99999
vim.opt.shell = "/bin/zsh" -- Shell по умолчанию
vim.opt.swapfile = false -- Отключить swap файлы nvim
vim.opt.encoding = "utf-8" -- Кодировка utf-8
vim.opt.cursorline = true -- Выделять активную строку где находится курсор
vim.opt.fileformat = "unix"

-- Nvim-Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Scroll
-- vim.opt.so = 30                       -- При скролле курсор всегда по центру

-- Search
vim.opt.ignorecase = true -- Игнорировать регистр при поиске
vim.opt.smartcase = true -- Не игнорирует регистр если в паттерне есть большие буквы
vim.opt.hlsearch = true -- Подсвечивает найденный паттерн
vim.opt.incsearch = true -- Интерактивный поиск

-- Mouse
vim.opt.mouse = "a" -- Возможность использовать мышку
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true -- Показывает номера строк
vim.opt.relativenumber = true -- Показывает расстояние к нужной строке относительно нашей позиции
vim.wo.number = true -- Показывает номера строк
vim.wo.relativenumber = true -- Показывает расстояние к нужной строке относительно нашей позиции

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Разрешить общий буфер обмена

-- Shorter messages
vim.opt.shortmess:append("c")

-- Использовать СИМВОЛЫ ТАБУЛЯЦИИ (\t)
vim.opt.expandtab = false -- Табы остаются табами
vim.opt.tabstop = 4 -- Один таб отображается как 4 пробела
vim.opt.shiftwidth = 4 -- Размер отступа для операторов >>, <<, ==
vim.opt.softtabstop = 0 -- Отключить (0), чтобы поведение было предсказуемым
vim.opt.smartindent = true -- Умные отступы
vim.opt.cindent = false -- Лучше отключить, если не пишете на C-- Fillchars

vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.opt.hidden = true

-- vim.cmd([[highlight clear LineNr]])
-- vim.cmd([[highlight clear SignColumn]])
