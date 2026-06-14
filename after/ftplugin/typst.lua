vim.pack.add({
	"github.com/chomosuke/typst-preview.nvim",
})

require("typst-preview").setup({
	follow_cursor = true,
	dependencies_bin = {
		tinymist = vim.fn.exepath("tinymist"),
		websocat = vim.fn.exepath("websocat"),
	},
})
