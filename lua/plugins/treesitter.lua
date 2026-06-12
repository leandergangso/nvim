vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

vim.schedule(function()
	local ts_config = require("config.treesitter")

	local ok_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
	if ok_ts then
		ts_configs.setup({
			ensure_installed = ts_config.parsers,
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
			},
		})
	end

	local ok_ctx, ts_context = pcall(require, "treesitter-context")
	if ok_ctx then
		ts_context.setup({
			enable = true,
			multiwindow = false,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		})
	end
end)
