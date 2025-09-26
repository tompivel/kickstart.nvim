return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- load before other UI plugins
  opts = {
    terminal_colors = true,
    contrast = 'hard', -- "hard" | "soft" | "" (default)
    transparent_mode = false,
    italic = { comments = false }, -- like your Tokyonight setup
  },
  config = function(_, opts)
    require('gruvbox').setup(opts)
    vim.o.background = 'dark' -- use the Dark variant
    vim.cmd.colorscheme 'gruvbox'
  end,
}
