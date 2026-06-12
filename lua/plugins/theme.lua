vim.pack.add({
	{
		src = "https://github.com/catppuccin/nvim",
		name = "catppuccin",
	},
})

local ok = pcall(vim.cmd.colorscheme, "catppuccin")
if not ok then
    vim.api.nvim_echo({
		{ "catppuccin not available, using default colorscheme", "WarningMsg" },
	}, true, {})
end
