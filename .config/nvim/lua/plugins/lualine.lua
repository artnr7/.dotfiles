return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "akinsho/bufferline.nvim",
  },
  config = function()
    -- Настройка Lualine (статусная строка)
    require("lualine").setup({
      options = {
        theme = "onedark",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    })
  end,
}
