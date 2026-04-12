local m = require("..ut.map")

m.mapN(
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Открыть диагностику" }
)

-- Hotkets like in IDE's
-- Copy
m.m("v", "<C-c>", "y", { noremap = true, desc = "Save us!" })

-- Save
m.mapN("<C-s>", function()
  require("conform").format({ lsp_format = "fallback", async = false })
  vim.cmd("w") -- сохраняем
  -- vim.cmd("echo 'Файл сохранён!'")
  vim.notify("💾 Saved", vim.log.levels.INFO, { title = "Save" })
  -- vim.api.nvim_echo({ { "💾 Файл сохранён!", "None" } }, false, {})
end, { noremap = false, silent = false, nowait = true, desc = "Save us!" })

-- Close tabs
m.mapN(
  "<C-w>",
  function()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "" then
      if bufname == "" then
        vim.cmd("q")
      else
        vim.cmd("wq")
      end
    else
      vim.cmd("q")
    end
  end,
  { noremap = true, silent = true, nowait = true, desc = "Close the window" }
)

-- m.mapN("<Esc>", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local bufname = vim.api.nvim_buf_get_name(bufnr)
--
--   if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "" then
--   else
--     vim.cmd("q")
--   end
-- end, { noremap = true, silent = true, nowait = true, desc = "Close the window" })

-- vim.keymap.set("i", "<A-j>", "<C-o>j<C-o>:m .+1<CR>", { noremap = true, silent = true }) -- перемещение

-- -- Ctrl + стрелки (по словам)
-- map("i", "<C-j>", "<C-o>gj", { desc = "Next line" })
-- map("i", "<C-k>", "<C-o>gk", { desc = "Prev line" })

m.mapN("<C-A-h>", "<C-w>H", { desc = "Change to the left win" })
m.mapN("<C-A-l>", "<C-w>L", { desc = "Change to the right win" })
m.mapN("<C-A-j>", "<C-w>J", { desc = "Change to the down win" })
m.mapN("<C-A-k>", "<C-w>K", { desc = "Change to the upper win" })

m.mapN("<C-h>", "<C-w>h", { desc = "Change to the left win" })
m.mapN("<C-l>", "<C-w>l", { desc = "Change to the right win" })
m.mapN("<C-j>", "<C-w>j", { desc = "Change to the down win" })
m.mapN("<C-k>", "<C-w>k", { desc = "Change to the upper win" })

-- Alt + стрелки (как в IDE)
m.mapI("<A-j>", "<C-o>j", { desc = "Down" })
m.mapI("<A-h>", "<C-o>h", { desc = "Left" })
m.mapI("<A-k>", "<C-o>k", { desc = "Up" })
m.mapI("<A-l>", "<C-o>l", { desc = "Right" })

-- Плавающий терминал
m.mapN(
  "<leader>t",
  "<cmd>FloatermToggle<CR>",
  { desc = "Toggle floating terminal" }
)
m.m("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Telescope
-- map("<leader>ff", "<cmd>Telescope find_files<CR>", "Find files")
-- map("<leader>fg", "<cmd>Telescope live_grep<CR>", "Live grep")
-- map("<leader>fb", "<cmd>Telescope buffers<CR>", "Find buffers")

--Persistance
-- load the session for the current directory
-- m.mapN("<leader>qs", function()
--   require("persistence").load()
-- end)

-- select a session to load
-- m.mapN("<leader>qS", function()
--   require("persistence").select()
-- end)

-- load the last session
-- m.mapN("<leader>ql", function()
--   require("persistence").load({ last = true })
-- end)

-- stop Persistence => session won't be saved on exit
-- m.mapN("<leader>qd", function()
--   require("persistence").stop()
-- end)

-- Markdown
-- vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })
-- vim.keymap.set("v", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- LSP
--keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
--keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- DAP
--keymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", { desc = "Debug continue" })
--keymap("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })

-- Управление вкладками
--keymap("n", "<leader>tc", "<cmd>BufferLinePickClose<CR>", { desc = "Close tab" })
-- keymap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
-- keymap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
--keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to tab 1" })
--keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to tab 2" })
--keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to tab 3" })
