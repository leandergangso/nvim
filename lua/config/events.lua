local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local MyGroup = augroup("MyGroup", {})
local YankGroup = augroup("YankGroup", {})

-- highlight yanked text for a brief moment
autocmd("TextYankPost", {
    group = YankGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 80,
        })
    end
})

-- setup LSP keymaps
autocmd("LspAttach", {
    group = MyGroup,
    callback = function(e)
        local opts = { buffer = e.buf } -- only apply to the current buffer
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    end
})
