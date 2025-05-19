-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Theme
vim.cmd [[colorscheme wombat]]

-- Line numbering
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- File encondings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"


vim.keymap.set('n', '<C-f>', ':FZF<CR>')

