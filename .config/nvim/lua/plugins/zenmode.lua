return -- Lua
{
  "folke/zen-mode.nvim",
  opts = {
    vim.keymap.set(
      "n",
      "<leader>z",
      ":ZenMode<CR>",
      { noremap = true, silent = true, desc = "Single Buffer" }
    ),
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
