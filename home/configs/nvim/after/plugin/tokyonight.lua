local tokyonight = require("tokyonight")
local colors = require("nix").colors

tokyonight.setup({
  style = "night",
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
    comments = { italic = false },
    keywords = { italic = false },
  },
  lualine_bold = true,

  on_colors = function(c)
    for k, v in pairs(colors) do
      c[k] = v
    end

    c.black = c.bg
    c.bg_visual = c.bg_highlight
    c.bg_statusline = c.black
    c.fg_gutter = c.bg_highlight
  end,

  on_highlights = function(hl, c)
    hl.LineNr = { fg = c.dark3 }

    hl["@comment.note"] = { fg = c.hint, bold = true}
    hl["@comment.error"] = { fg = c.error, bold = true}
    hl["@comment.hint"] = { fg = c.hint, bold = true}
    hl["@comment.info"] = { fg = c.info, bold = true}
    hl["@comment.warning"] = { fg = c.warning, bold = true}
    hl["@comment.todo"] = { fg = c.todo, bold = true}


    -- TODO: I think we can do that like this.
    hl.LineNrAbove = { fg = c.dark3 }
    hl.LineNrBelow = { fg = c.dark3 }
    hl.VirtColumn = { fg = c.dark3 }

    hl.DiagnosticVirtualTextError = { fg = c.red1 }
    hl.DiagnosticVirtualTextHint = { fg = c.teal }
    hl.DiagnosticVirtualTextInfo = { fg = c.blue2 }
    hl.DiagnosticVirtualTextWarn = { fg = c.yellow }

    hl.IlluminatedWordRead = { underline = true }
    hl.IlluminatedWordText = { underline = true }
    hl.IlluminatedWordWrite = { underline = true }

    hl.ExtraWhitespace = { bg = c.red }

    hl.TreesitterContext = {}
    hl.TreesitterContextSeparator = { fg = c.dark3 }

    hl.Folded = { bg = "none" }
    hl.UfoFoldedBg = { bg = "none" }

    hl.DapBreakpoint = { fg = c.red }
    hl.DapLogPoint = { fg = c.purple }
    hl.DapStopped = { fg = c.yellow }
    hl.DapUIBreakpointsLine = { bg = c.yellow }
  end,
})

vim.cmd([[colorscheme tokyonight]])
