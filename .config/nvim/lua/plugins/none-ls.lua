return {
	"nvimtools/none-ls.nvim",
	config = function()
		local ls = require("null-ls")

		ls.setup({
			sources = {
				ls.builtins.formatting.stylua,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
