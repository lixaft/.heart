local telescope = require("telescope")
local builtin = require("telescope.builtin")
local c = require("theme").colors

telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",

    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 120,
      },
    },
  },

  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },

    live_grep = {
      additional_args = {
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
  },
})

vim.keymap.set("n", "<c-p>", builtin.find_files)
vim.keymap.set("n", "<leader>/", builtin.live_grep)
vim.keymap.set("n", "<leader>sH", builtin.highlights)
vim.keymap.set("n", "<leader>sM", builtin.marks)
vim.keymap.set("n", "<leader>sc", builtin.commands)
vim.keymap.set("n", "<leader>sf", builtin.filetypes)
vim.keymap.set("n", "<leader>sh", builtin.help_tags)
vim.keymap.set("n", "<leader>sk", builtin.keymaps)
vim.keymap.set("n", "<leader>sn", builtin.spell_suggest)
vim.keymap.set("n", "<leader>sr", builtin.registers)

vim.api.nvim_create_user_command("Hi", builtin.highlights, {})
vim.api.nvim_create_user_command("Man", builtin.man_pages, {})
vim.api.nvim_create_user_command("Reg", builtin.registers, {})

vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = c.orange })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = c.orange, bold = true })
