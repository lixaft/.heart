
vim.opt.termguicolors = true

-- Turn that damn bell off...
vim.opt.belloff = "all"

-- Display.
vim.opt.shortmess = "I"
vim.opt.showmode = false

-- Columns.
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = { "80", "100" }
vim.opt.number = true
vim.opt.relativenumber = true

-- Scroll.
vim.opt.scrolloff = 8

-- Search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Interactive search/replace.
vim.opt.inccommand = "split"

-- Wrap.
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "> "

-- Split.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Backup.
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.directory = os.getenv("HOME") .. "/.cache/nvim/swap"
vim.opt.backupdir = os.getenv("HOME") .. "/.cache/nvim/backup"
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"

-- Mouse.
vim.opt.mouse = "a"
