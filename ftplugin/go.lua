local bufnr = vim.b.bufnr
local opts = { buffer = bufnr }

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", opts)

vim.keymap.set("n", "<leader>ep", "oif err != nil {<CR>}<Esc>Opanic(err)<Esc>", opts)

vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a', opts)

vim.keymap.set(
	"n",
	"<leader>ef",
	'oif err != nil {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj',
	opts
)

vim.keymap.set(
	"n",
	"<leader>el",
	'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i',
	opts
)
