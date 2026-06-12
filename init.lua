require("config.options")
require("config.keymaps")
require("config.filetypes")
require("config.events")

--require("plugins.theme")

--local plugin_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
--local plugin_files = {}
--
--for name, kind in vim.fs.dir(plugin_dir) do
--	if kind == "file" and name:sub(-4) == ".lua" and name ~= "theme.lua" then
--		plugin_files[#plugin_files + 1] = name
--	end
--end
--
--for _, file in ipairs(plugin_files) do
--	require("plugins." .. file:sub(1, -5))
--end
