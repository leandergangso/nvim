return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "stevearc/conform.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua", stop_after_first = true },
                    json = { "prettierd", "prettier", stop_after_first = true },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                }
            })

            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            local fidget = require("fidget")
            fidget.setup({})

            local mason = require("mason")
            mason.setup({})

            local lspconfig = require("lspconfig")
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                automatic_installation = false,
                auto_install = true,
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "emmet_ls",
                },
                handlers = {
                    function(server_name) -- default handler
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["gopls"] = function()
                        lspconfig.gopls.setup({
                            capabilities = capabilities,
                            settings = {
                                gopls = {
                                    staticcheck = true,
                                    completeUnimported = true,
                                    usePlaceholders = true,
                                    semanticTokens = true,
                                    analyses = {
                                        unusedparams = true,
                                        unusedwrite = true,
                                        unreachable = true,
                                        deprecated = true,
                                        nilness = true,
                                    },
                                },
                            },
                        })
                    end,
                    ["html"] = function()
                        lspconfig.html.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "templ" },
                        })
                    end,
                    ["htmx"] = function()
                        lspconfig.htmx.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "templ" },
                        })
                    end,
                    ["emmet_ls"] = function()
                        lspconfig.emmet_ls.setup({
                            capabilities = capabilities,
                            filetypes = { "html", "css", "templ" }
                        })
                    end,
                    ["templ"] = function()
                        lspconfig.templ.setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["tailwindcss"] = function()
                        lspconfig.tailwindcss.setup({
                            capabilities = capabilities,
                            filetypes = { "templ", "astro", "javascript", "typescript", "react" },
                            settings = {
                                tailwindCSS = {
                                    includeLanguages = {
                                        templ = "html",
                                    },
                                },
                            },
                        })
                    end,
                },
            })

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "lazydev", group_index = 0 },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            })

            -- vim.diagnostic.config({
            --     -- update_in_insert = true,
            --     float = {
            --         focusable = false,
            --         style = "minimal",
            --         border = "rounded",
            --         source = "always",
            --         header = "",
            --         prefix = "",
            --     },
            -- })
        end
    },
}
