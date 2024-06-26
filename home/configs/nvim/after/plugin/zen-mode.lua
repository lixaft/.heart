local zen = require("zen-mode")

zen.setup({
  window = {
    backdrop = 1,
    width = 1,
  },
})

vim.keymap.set("n", "<c-w>z", zen.toggle)
