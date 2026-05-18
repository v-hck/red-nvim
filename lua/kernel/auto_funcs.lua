function SetColor()
	vim.cmd.colorscheme("red")
end

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			vim.api.nvim_win_set_cursor(0, { mark[1], mark[2] })
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.json", "*.jsonc" },
    callback = function()
        vim.lsp.buf.format({ name = "biome", timeout_ms = 2000 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})
