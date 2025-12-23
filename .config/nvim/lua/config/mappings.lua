local keymap = vim.keymap.set

local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { desc = "Default: " .. desc })
end

-- Main
-- Hotkets like in IDE's
keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save us!" })
keymap("n", "<C-w>", ":q<CR>", { noremap = true, silent = true, desc = "Close the window" })

-- Alt + стрелки (как в IDE)
-- map("i", "<A-j>", "<C-o>j:startinsert<CR>", { desc = "Down" })
-- map("i", "<A-k>", "<C-o>k", { desc = "Up" })
-- map("i", "<A-h>", "<C-o>h", { desc = "Left" })
-- map("i", "<A-l>", "<C-o>l", { desc = "Right" })

-- -- Ctrl + стрелки (по словам)
-- map("i", "<C-j>", "<C-o>gj", { desc = "Next line" })
-- map("i", "<C-k>", "<C-o>gk", { desc = "Prev line" })

-- Быстрый конец/начало файла
map("i", "<C-G>", "<C-o>G", { desc = "End of file" })
map("i", "<C-Home>", "<C-o>gg", { desc = "Start of file" })

-- File tree
map("<C-t>", "<cmd>Neotree toggle<CR>", "Toggle file tree")
map("<C-h>", "<C-w>h", "Change to the left win")
map("<C-l>", "<C-w>l", "Change to the right win")
map("<C-j>", "<C-w>j", "Change to the down win")
map("<C-k>", "<C-w>k", "Change to the upper win")

-- Telescope
map("<leader>ff", "<cmd>Telescope find_files<CR>", "Find files")
map("<leader>fg", "<cmd>Telescope live_grep<CR>", "Live grep")
map("<leader>fb", "<cmd>Telescope buffers<CR>", "Find buffers")

-- cmake-tools
keymap("n", "<leader>cg", function()
  vim.cmd("CMakeGenerate")
end, { desc = "CMake Generate" })

keymap("n", "<leader>cb", function()
  vim.cmd("CMakeBuild")
end, { desc = "CMake Build" })

keymap("n", "<leader>cc", function()
  vim.cmd("CMakeClean")
end, { desc = "CMake Clean" })

keymap("n", "<leader>cd", function()
  vim.cmd("CMakeDebug")
end, { desc = "CMake Debug" })

keymap("n", "<leader>cr", function()
  vim.cmd("CMakeRun")
end, { desc = "CMake Run" })

keymap("n", "<leader>cs", function()
  vim.cmd("CMakeStop")
end, { desc = "CMake Stop" })

--Persistance
-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end)

-- Markdown
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })
vim.keymap.set("v", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- LSP
--keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
--keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- DAP
--keymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", { desc = "Debug continue" })
--keymap("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })

-- Плавающий терминал
map("<leader>t", "<cmd>FloatermToggle<CR>", "Toggle floating terminal")
map("<Esc>", "<C-\\><C-n>", "Exit terminal mode", "t")

-- Управление вкладками
--keymap("n", "<leader>tc", "<cmd>BufferLinePickClose<CR>", { desc = "Close tab" })
-- keymap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
-- keymap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
--keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to tab 1" })
--keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to tab 2" })
--keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to tab 3" })
