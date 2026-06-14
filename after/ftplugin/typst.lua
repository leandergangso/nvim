if vim.g.typst_preview_loaded then
	return
end

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

vim.g.typst_preview_loaded = true
