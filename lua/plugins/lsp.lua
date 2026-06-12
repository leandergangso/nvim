vim.pack.add({
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/j-hui/fidget.nvim",
})

vim.schedule(function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp_lsp then
		capabilities = cmp_lsp.default_capabilities()
	end

	local ok_fidget, fidget = pcall(require, "fidget")
	if ok_fidget then
		fidget.setup({})
	end

	local function configure(server_name, opts)
		opts = opts or {}
		opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
		vim.lsp.config(server_name, opts)
	end

	configure("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})

	configure("gopls", {
		settings = {
			gopls = {
				gofumpt = true,
				staticcheck = true,
				usePlaceholders = true,
				completeUnimported = true,
				analyses = {
					unusedparams = true,
					unusedwrite = true,
					nilness = true,
					shadow = false,
					ST1000 = false,
				},
			},
		},
	})

	configure("cssls", {
		settings = {
			css = {
				lint = {
					unknownAtRules = "ignore",
				},
			},
			scss = {
				lint = {
					unknownAtRules = "ignore",
				},
			},
			less = {
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	})

	configure("svelte", {})
	configure("tailwindcss", {})
	configure("ts_ls", {})

	local servers = {
		lua_ls = "lua-language-server",
		gopls = "gopls",
		cssls = "vscode-css-language-server",
		svelte = "svelteserver",
		tailwindcss = "tailwindcss-language-server",
		ts_ls = "typescript-language-server",
	}

	for server_name, command in pairs(servers) do
		if vim.fn.executable(command) == 1 then
			vim.lsp.enable(server_name)
		end
	end

	local ok_cmp, cmp = pcall(require, "cmp")
	if not ok_cmp then
		return
	end
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	vim.api.nvim_set_hl(0, "CmpItemAbbr", { link = "Comment" })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment" })

	cmp.setup({
		preselect = cmp.PreselectMode.None,
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		snippet = {
			expand = function(args)
				local ok_luasnip, luasnip = pcall(require, "luasnip")
				if ok_luasnip then
					luasnip.lsp_expand(args.body)
					return
				end

				vim.snippet.expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
		window = {
			completion = cmp.config.window.bordered({
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			}),
			documentation = cmp.config.window.bordered({
				border = { "", "", "", " " },
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}),
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = " " .. vim_item.kind
				vim_item.menu = ({
					nvim_lsp = "LSP",
					luasnip = "Snip",
					buffer = "Buf",
					path = "Path",
				})[entry.source.name] or ""

				return vim_item
			end,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end)
