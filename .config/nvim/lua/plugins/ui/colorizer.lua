return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup({ "css", "javascript", html = { mode = "background" } })
  end,
}
