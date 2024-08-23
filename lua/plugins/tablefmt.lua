return {
	"junegunn/vim-easy-align",

	config = function()
		vim.keymap.set({ "v", "n" }, "ga", ":EasyAlign<CR>")
	end,
}
