return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
        opts = {
          auto_install = true
        }
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
				callback = function(event)
					local opts = { buffer = event.buf }


					vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end, opts)
					vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end,
			})
		end,
	},
}