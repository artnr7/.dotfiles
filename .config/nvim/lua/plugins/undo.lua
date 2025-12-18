return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    { "g-", ":earlier 1f<CR>", { silent = true } },
    { "g+", ":later 1f<CR>", { silent = true } },
  },
}
