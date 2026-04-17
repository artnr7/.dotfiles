-- return {
--   {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     build = "cd app && yarn install",
--     init = function()
--       vim.g.mkdp_filetypes = { "markdown" }
--     end,
--     ft = { "markdown" },
--   },
-- }
-- return {
--   "OXY2DEV/markview.nvim",
--   lazy = false,
--
--   -- Completion for `blink.cmp`
--   -- dependencies = { "saghen/blink.cmp" },
-- }
local m = require("..ut.map")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- enabled = false,
  },
  config = function()
    require("render-markdown").enable()
    require("render-markdown").buf_disable()
  end,
  m.mapN(
    "<leader>p",
    "<cmd>RenderMarkdown preview<CR>",
    { desc = "Markdown preview" }
  ),
}
