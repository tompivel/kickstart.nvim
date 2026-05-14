-- ~/.config/nvim/ftplugin/java.lua
local jdtls = require 'jdtls'
local root = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
if not root then
  return
end

local project = vim.fn.fnamemodify(root, ':p:h:t')
local workspace = vim.fn.stdpath 'data' .. '/jdtls-workspace/' .. project
local caps = require('blink.cmp').get_lsp_capabilities()

jdtls.start_or_attach {
  cmd = { 'jdtls', '-data', workspace },
  root_dir = root,
  capabilities = caps,
  settings = {
    java = { configuration = { updateBuildConfiguration = 'interactive' } },
  },
}
