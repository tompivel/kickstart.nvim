-- lua/custom/plugins/notes.lua
return {
  -- Obsidian.nvim: wikilinks [[...]], backlinks, daily notes, templates
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown', -- lazy-load on Markdown files
    cmd = { -- and also load when you run these commands
      'ObsidianQuickSwitch',
      'ObsidianSearch',
      'ObsidianFollowLink',
      'ObsidianBacklinks',
      'ObsidianToday',
      'ObsidianNew',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        { name = 'notes', path = '~/Notes' },
      },
      notes_subdir = '00-inbox',
      daily_notes = { folder = '01-daily', date_format = '%Y-%m-%d' },
      templates = {
        folder = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
      },
      disable_frontmatter = false,
      follow_url_func = function(url)
        vim.fn.jobstart { 'xdg-open', url }
      end,
      ui = { enable = true },
    },
    keys = {
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'Notes: New' },
      { '<leader>oo', '<cmd>ObsidianToday<cr>', desc = 'Notes: Today' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Notes: Quick Switch' },
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Notes: Search' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Notes: Backlinks' },
      {
        'gf',
        function()
          local obsidian = require 'obsidian'
          local util = require 'obsidian.util'
          if util.cursor_on_markdown_link() then
            vim.cmd 'ObsidianFollowLink'
          else
            return util.gf_passthrough()
          end
        end,
        desc = 'Follow wiki/file link',
        noremap = false,
        expr = true,
      },
    },
  },

  -- img-clip.nvim: paste images from clipboard -> assets/ and insert ![](…)
  {
    'HakonHarnes/img-clip.nvim',
    ft = 'markdown', -- lazy-load on Markdown
    opts = {
      default = {
        img_dir = 'assets',
        img_dir_txt = 'assets',
        affix = '![]($1)',
        prompt_for_file_name = true,
      },
    },
    keys = {
      {
        '<leader>p',
        function()
          require('img-clip').paste_image()
        end,
        desc = 'Paste image',
      },
    },
  },
}
