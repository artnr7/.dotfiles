return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    buffers = {
      left = {
        enabled = false,
      },
    },
    width = 80,
    buffers = {
      backgroundColor = "onedark",
      blend = -0.1,
      scratchPad = {
        enabled = true,
        fileName = "notes",
        location = "~/",
      },
      bo = {
        filetype = "md",
      },
    },
  },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>z",
      ":NoNeckPain<CR>",
      { noremap = true, silent = true, desc = "Single Buffer" }
    )
  end,
}
