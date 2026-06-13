vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		svelte = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
	},
})
