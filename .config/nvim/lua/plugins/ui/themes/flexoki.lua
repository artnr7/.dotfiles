return {
  "kepano/flexoki-neovim",
  name = "flexoki",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("flexoki").setup({
      -- ...
    })

    vim.cmd("colorscheme flexoki-dark")
  end,
}
