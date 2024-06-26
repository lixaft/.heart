local ufo = require("ufo")

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

ufo.setup({
  provider_selector = function(_bufnr, _filetype, _buftype)
    return { "treesitter", "indent" }
  end,

  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local new = {}
    local suffix = ("  󰁂 %d "):format(endLnum - lnum)
    local suffix_width = vim.fn.strdisplaywidth(suffix)
    local target_width = width - suffix_width
    local current_width = 0
    for _, chunk in ipairs(virtText) do
      local chunk_text = chunk[1]
      local chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if target_width > current_width + chunk_width then
        table.insert(new, chunk)
      else
        chunk_text = truncate(chunk_text, target_width - current_width)
        local hlGroup = chunk[2]
        table.insert(new, { chunk_text, hlGroup })
        chunk_width = vim.fn.strdisplaywidth(chunk_text)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if current_width + chunk_width < target_width then
          suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
        end
        break
      end
      current_width = current_width + chunk_width
    end
    table.insert(new, { suffix, "@comment" })
    return new
  end,
})

vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)
