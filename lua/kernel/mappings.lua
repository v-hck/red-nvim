vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')

-- Copy all text
-- vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- custom
local function copy_whole_file_formatted()
	local filetype = vim.bo.filetype
	if filetype == '' then
		filetype = 'text'
	end

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	table.insert(lines, 1, '```' .. filetype)
	table.insert(lines, #lines + 1, '```')
	local formatted_text = table.concat(lines, '\n')

	vim.fn.setreg('+', formatted_text)
	vim.fn.setreg('*', formatted_text)

	print('The File Copied like ```' .. filetype .. '```')
end

vim.keymap.set('n', '<leader>fd', copy_whole_file_formatted, { desc = 'Copy whole file as discord block' })
vim.keymap.set('n', '<leader>fy', function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local text = table.concat(lines, '\n')
	vim.fn.setreg('+', text)
	vim.fn.setreg('*', text)
	print('The file is copied')
end, { desc = 'Copy whole file' })

vim.keymap.set("n", "<leader>rt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>rd", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal current file", noremap = true, silent = true })
vim.keymap.set("n", "<leader>rc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse tree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>rf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on tree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>rr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh tree", noremap = true, silent = true })

local wk = require("which-key")
wk.add({
	{ "<leader>r",  group = "nvim-tree" },
	{ "<leader>f",  group = "file" },
	{ "<leader>w",  group = "which-key" },
	{ "<leader>c",  group = "code" },
	{ "<leader>t",  group = "toggle-term" },
	{ "<leader>x",  group = "trouble" },
	{ "<leader>e",  group = "View error/warn" },
	{ "<leader>g",  group = "git" },
	{ "<leader>q",  group = "buffer-line" },
	{ "<leader>z",  group = "nvim-ufo" },
	{ "<leader>d",  group = "neogen" },
	{ "<leader>v",  group = "todo-list" },
})

-- normal mode: Ctrl+A -> выделить всё
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })
-- insert mode: Ctrl+A -> выйти и выделить всё
vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { desc = 'Select all' })

vim.keymap.set("n", "<leader>cc", function() vim.cmd(".!"..vim.fn.expand('%:e')) end, {desc = "Paste code result"})
-- vim.keymap.set("n", "<leader>cR", function() vim.cmd(".w!"..vim.fn.expand('%:e')) end, {desc = "Run code"})
vim.keymap.set("v", "<leader>cc", function() vim.cmd("normal! \27"); vim.cmd("'<,'>!"..vim.fn.expand('%:e')) end, {desc = "Paste code result"})
-- vim.keymap.set("v", "<leader>cR", function() vim.cmd("normal! \27"); vim.cmd("'<,'>w!"..vim.fn.expand('%:e')) end, {desc = "Run code"})

vim.keymap.set('n', '<leader>dd', ':Neogen<CR>',        { desc = 'Generate annotations (auto)'  })
vim.keymap.set('n', '<leader>de', ':Neogen func<CR>',   { desc = 'Generate function annotation' })
vim.keymap.set('n', '<leader>dc', ':Neogen class<CR>',  { desc = 'Generate class annotation'    })
vim.keymap.set('n', '<leader>dw', ':Neogen type<CR>',   { desc = 'Generate type annotation'     })
vim.keymap.set('n', '<leader>df', ':Neogen file<CR>',   { desc = 'Generate file annotation'     })
vim.keymap.set('n', '<leader>dq', ':Neogen method<CR>', { desc = 'Generate method annotation'   })

vim.keymap.set('n', '<leader>vd', ':TodoTelescope<CR>', { desc = 'List of tags'   })
vim.keymap.set('n', '<leader>ve', ':TodoLocList<CR>', { desc = 'List of tags like new file'   })
vim.keymap.set('n', '<leader>vq', ':TodoQuickFix<CR>', { desc = 'List of fixs like new file'   })
