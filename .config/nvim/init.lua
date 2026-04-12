if vim.g.vscode then
  require("config.options")
  require("config.mappings")

  -- require("config.lazy_vscode")
  require("config.lazy")
else
  require("config.options")
  require("config.mappings")
  require("config.autocmd")

  require("config.lazy")
end
