vim.pack.add({
	"github.com/folke/which-key.nvim",
})

require("which-key").setup({
	delay = 3000,
	icons = {
		mappings = true,
		keys = {},
	},
})
