return {
  {
    "smithbm2316/centerpad.nvim",
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>z",
        "<cmd>Centerpad 100 10<cr>",
        { silent = true, noremap = true }
      )
    end,
  },
}
