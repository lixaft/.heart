local lualine = require("lualine")
local c = require("theme").colors

lualine.setup({
  options = {
    theme = {
      normal = {
        a = { fg = c.bar.bg_light, bg = c.accent, gui = "bold" },
        b = { fg = c.bar.fg, bg = c.bar.bg_light },
        c = { fg = c.bar.fg, bg = c.bar.bg_dark },
      },
      insert = { a = { fg = c.bar.bg_light, bg = c.magenta, gui = "bold" } },
      visual = { a = { fg = c.bar.bg_light, bg = c.magenta, gui = "bold" } },
      replace = { a = { fg = c.bar.bg_light, bg = c.red, gui = "bold" } },
      command = { a = { fg = c.bar.bg_light, bg = c.yellow, gui = "bold" } },
      terminal = { a = { fg = c.bar.bg_light, bg = c.green, gui = "bold" } },
    },

    component_separators = {
      left = "।",
      right = "।",
    },

    globalstatus = true,

    section_separators = {
      left = "",
      right = "",
    },
  },

  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      "branch",
      "diff",
      "diagnostics",
    },
    lualine_c = {
      "filename",
    },
    lualine_x = {
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      "location",
    },
  },
})
