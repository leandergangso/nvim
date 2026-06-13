vim.pack.add({
	"github.com/folke/which-key.nvim",
})

local which_key = require("which-key")
which_key.setup({
	delay = 3000,
	icons = {
		mappings = true,
		keys = {},
	},
})
