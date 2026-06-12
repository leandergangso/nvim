if vim.b.typst_preview_loaded then
	return
end

vim.pack.add({
	"https://github.com/chomosuke/typst-preview.nvim",
})

local ok, typst_preview = pcall(require, "typst-preview")
if not ok then
	return
end

typst_preview.setup({
	follow_cursor = true,
})

vim.b.typst_preview_loaded = true
