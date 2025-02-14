return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            'lua',
            'luadoc',
            'bash',
            'go',
            'markdown',
            'markdown_inline',
        },
        auto_install = true,
        sync_install = false,
        indent = { enable = true },
        highlight = {
            enable = true,
            disable = function(_, buf)
                --if lang == "html" then
                --  print("disabled treesitter")
                --  return true
                --end
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    vim.notify(
                        "File larger then 100KB, treesitter disabled for performance",
                        vim.log.levels.WARN,
                        { title = "Treesitter" }
                    )
                    return true
                end
            end,
            --additional_vim_regex_highlighting = { "markdown" },
        }
    },
}
