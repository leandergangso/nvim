vim.pack.add({
	"https://github.com/mbbill/undotree",
})

vim.keymap.set("n", "<leader>u", function()
	if vim.fn.exists(":UndotreeToggle") == 2 then
		vim.cmd.UndotreeToggle()
	end
end, { desc = "[U]ndo Tree" })
