vim.pack.add({
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/windwp/nvim-autopairs",
})

local ok_ap, autopairs = pcall(require, "nvim-autopairs")
if ok_ap then
	autopairs.setup({})

	local ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	local ok_cmp, cmp = pcall(require, "cmp")
	if ok_cmp_autopairs and ok_cmp then
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
end
