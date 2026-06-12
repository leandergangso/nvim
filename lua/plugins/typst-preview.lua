vim.pack.add({
	{
		src = "https://github.com/chomosuke/typst-preview.nvim",
	},
})

vim.schedule(function()
	local ok, typst_preview = pcall(require, "typst-preview")
	if not ok then
		return
	end

	typst_preview.setup({
		follow_cursor = true,
	})
end)
