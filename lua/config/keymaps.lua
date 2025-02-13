vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: curretly telescope and oil uses different keymaps for opening buffer splits (i'm not much of a split person so perhaps don't care?)

-- insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape to normal mode" })

-- common commands
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "[-] File Explorer" })
vim.keymap.set("n", "<leader>db", "<cmd>Alpha<CR>", { desc = "[D]ash[B]oard" })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy" })
vim.keymap.set("n", "<leader>mp", "<cmd>Glow<CR>", { desc = "[M]arkdown [P]review" })

-- write to disk
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "[W]rite [A]ll" })

-- window navigation
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>")
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>")
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>")
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>")

-- buffer navigation
vim.keymap.set('n', '<leader>bn', "<cmd>bn<CR>", {desc="[B]uffer [N]ext"})
vim.keymap.set('n', '<leader>bp', "<cmd>bp<CR>", {desc="[B]uffer [P]rev"})
vim.keymap.set('n', '<leader>bd', "<cmd>bd<CR>", {desc="[B]uffer [D]elete"})
vim.keymap.set('n', '<leader>bw', "<cmd>bw<CR>", {desc="[B]uffer [W]ipeout"})

-- move the lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center the action
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- to the void
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [[\"_d]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word the carret is curretly on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<leander>nh", "<cmd>nohl<CR>", { desc="[N]o [H]ighlight"})

vim.keymap.set("n", "Q", "<nop>")
