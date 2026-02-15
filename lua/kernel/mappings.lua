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

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', '<leader>cR', vim.lsp.buf.references, { desc = 'Show references' })
vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>E', vim.lsp.buf.hover, { desc = 'Show hover documentation' })
vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
vim.keymap.set('n', '<leader>cw', function() vim.lsp.buf.format { async = true } end, { desc = 'Format buffer' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', '<leader>ce', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
-- vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Add diagnostics to location list' })
vim.keymap.set('n', '<leader>cWa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace folder' })
vim.keymap.set('n', '<leader>cWr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace folder' })
vim.keymap.set('n', '<leader>cWl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = 'List workspace folders' })
vim.keymap.set('n', '<leader>clc', '<cmd>LspInfo<cr>', { desc = 'LSP Info' })
vim.keymap.set('n', '<leader>cls', '<cmd>LspStop<cr>', { desc = 'LSP Stop' })
vim.keymap.set('n', '<leader>clS', '<cmd>LspStart<cr>', { desc = 'LSP Start' })
vim.keymap.set('n', '<leader>clr', '<cmd>LspRestart<cr>', { desc = 'LSP Restart' })
vim.keymap.set('n', '<leader>af', ':ALEFix<CR>', { desc = 'Fix file with configured fixers' })
vim.keymap.set('n', '<leader>aT', ':ALEToggle<CR>', { desc = 'Toggle ALE on/off for buffer' })
vim.keymap.set('n', '<leader>ai', ':ALEInfo<CR>', { desc = 'Show ALE info for current buffer' })

vim.keymap.set('n', '<leader>q', '<cmd>NvimTreeFocus<CR>')


local wk = require("which-key")
wk.add({
	{ "<leader>e",  group = "View Diagnostic Message" },
	{ "<leader>q",  group = "Focus Nvim Tree" },

	{ "<leader>r",  group = "nvim-tree" },
	{ "<leader>f",  group = "file" },
	{ "<leader>w",  group = "which-key" },
	{ "<leader>c",  group = "code" },
	{ "<leader>t",  group = "toggle-term" },
	{ "<leader>x",  group = "trouble" },
	{ "<leader>g",  group = "git" },
	{ "<leader>b",  group = "buffer-line" },
	{ "<leader>z",  group = "nvim-ufo" },
	{ "<leader>d",  group = "neogen" },
	{ "<leader>v",  group = "todo-list" },
	{ "<leader>a",  group = "ale" },

	{ "<leader>cW",  group = "workspace" },
	{ "<leader>cl",  group = "lsp" },
})
