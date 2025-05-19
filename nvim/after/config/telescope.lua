local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files)

require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
