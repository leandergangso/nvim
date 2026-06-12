vim.pack.add({
	{
		src = "https://github.com/catppuccin/nvim",
		name = "catppuccin",
	},
})

local ok = pcall(vim.cmd.colorscheme, "catppuccin")
if not ok then
	vim.notify("catppuccin not available, using default colorscheme", vim.log.levels.WARN)
end
