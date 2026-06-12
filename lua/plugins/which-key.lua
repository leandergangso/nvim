vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local ok, which_key = pcall(require, "which-key")
if not ok then
	return
end

which_key.setup({
	delay = 3000,
	icons = {
		mappings = true,
		keys = {},
	},
})
