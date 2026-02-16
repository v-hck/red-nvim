return {
	"danymat/neogen",
	lazy = true,
	cmd = "Neogen",
	config = true,
	opts = {
		enabled = true, -- Enable neogen
		input_after_comment = true, -- Auto‑enter insert mode after annotation
		snippet_engine = "nvim", -- Built‑in jumps, no snippet engine required
		-- languages = {
		-- 	lua = {
		-- 		template = { annotation_convention = "ldoc" }
		-- 	},
		-- 	luau = {
		-- 		template = { annotation_convention = "ldoc" }
		-- 	},
		-- }
	},
	keys = {
		-- Generate annotation for the current context (function/class/etc.)
		{ "<leader>dc", ":Neogen<CR>", desc = "Generate annotations (auto)", mode = "n" },
		-- Force a specific annotation type
		{ "<leader>dq", ":Neogen func<CR>", desc = "Generate function annotation", mode = "n" },
		{ "<leader>dw", ":Neogen class<CR>", desc = "Generate class annotation", mode = "n" },
		{ "<leader>de", ":Neogen type<CR>", desc = "Generate type annotation", mode = "n" },
		{ "<leader>dd", ":Neogen file<CR>", desc = "Generate file annotation", mode = "n" },
		-- Additional types (if supported by your language)
		{ "<leader>df", ":Neogen method<CR>", desc = "Generate method annotation", mode = "n" },
	},
}
