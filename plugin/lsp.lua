vim.pack.add({
	"https://github.com/j-hui/fidget.nvim",
})

require("fidget").setup({})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"cssls",
	"svelte",
	"tailwindcss",
	"ts_ls",
})
