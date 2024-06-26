local group = vim.api.nvim_create_augroup("lixaft", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {
    "fugitive",
    "harpoon",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = event.buf })
    vim.keymap.set("n", "<c-c>", "<cmd>close<cr>", { buffer = event.buf })
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf })
  end,
})
