local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'ellisonleao/gruvbox.nvim' }
---@diagnostic disable-next-line: missing-fields
require('gruvbox').setup {
  terminal_colors = true,
  contrast = 'hard', -- "hard" | "soft" | "" (default)
  transparent_mode = false,
  italic = { comments = false },
}
vim.o.background = 'dark' -- use the Dark variant
vim.cmd.colorscheme 'gruvbox'
