-- required for templ to work
--vim.filetype.add({ extension = { templ = "templ" } })

-- run cmd on enter to enable highlighting for templ files
--vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.templ", callback = function() vim.cmd("TSBufEnable highlight") end })
