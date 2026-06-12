vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local data = ev.data
		if not data or data.spec.name ~= "LuaSnip" then
			return
		end

		if data.kind == "install" or data.kind == "update" then
			vim.system({ "make", "install_jsregexp" }, { cwd = data.path }):wait()
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = vim.version.range("2"),
	},
	"https://github.com/rafamadriz/friendly-snippets",
})

local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end

ls.filetype_extend("javascript", { "jsdoc" })
