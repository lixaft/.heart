-- Window.
vim.keymap.set("n", "<m-left>", "<c-w>h")
vim.keymap.set("n", "<m-right>", "<c-w>l")
vim.keymap.set("n", "<m-up>", "<c-w>k")
vim.keymap.set("n", "<m-down>", "<c-w>j")

vim.keymap.set("n", "<s-left>", "<c-w>5<")
vim.keymap.set("n", "<s-right>", "<c-w>5>")
vim.keymap.set("n", "<s-up>", "<c-w>5+")
vim.keymap.set("n", "<s-down>", "<c-w>5-")

vim.keymap.set("n", "<c-left>", "<c-w>H")
vim.keymap.set("n", "<c-right>", "<c-w>L")
vim.keymap.set("n", "<c-up>", "<c-w>K")
vim.keymap.set("n", "<c-down>", "<c-w>J")

-- Keep cursor at the middle of the screen on big vertical movement.
vim.keymap.set("n", "<c-o>", "<c-o>zz")
vim.keymap.set("n", "<c-i>", "<c-i>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Make `n` and `N` search consistent between `/` and `?`.
vim.keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true })

-- Go to next/prev element of loclist and qflist.
vim.keymap.set("n", "<c-j>", ":cnext<cr>zz")
vim.keymap.set("n", "<c-k>", ":cprev<cr>zz")
vim.keymap.set("n", "<leader>j", ":lnext<cr>zz")
vim.keymap.set("n", "<leader>k", ":lprev<cr>zz")

-- Make `j` and `k` more natural with line wrap.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Move line(s) up and down.
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- Paste over visual selection.
vim.keymap.set({ "v" }, "<leader>p", [["_dP]])

-- Do not move cursor on join line.
vim.keymap.set("n", "J", "mzJ`z")

-- Preserve selection on indent.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Toggle highlight features.
vim.keymap.set("n", "gh", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "gs", "<cmd>set spell!<cr>")

-- Escape (keep it hidden in the bottom of the file :s).
vim.keymap.set({ "n", "i", "v" }, "<c-c>", "<esc>")
