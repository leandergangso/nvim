return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            'lua',
            'luadoc',
            'bash',
            'go',
            'html',
            'javascript',
            'typescript',
            'markdown',
            'markdown_inline',
            'vim',
            'vimdoc',
        },
        auto_install = true,
        sync_install = false,
        indent = { enable = true },
        highlight = {
            enable = true,
            --additional_vim_regex_highlighting = { "markdown" },
        }
    },
}
