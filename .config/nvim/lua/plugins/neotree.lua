local m = require("..ut.z_utils_map")

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/snacks.nvim",
  },
  config = function()
    require("neo-tree").setup({
      m.mapN("<leader>w", "<cmd>Neotree toggle float<CR>", "Neotree float"),
      vim.keymap.set("n", "<C-t>", "<cmd>Neotree toggle left<CR>"),
      -- !!! Если чёта не работает наберите :Neotree migrations
      auto_clean_after_session_restore = true,
      -- close_if_last_window = true, -- Закрыть neo-tree, если это последнее окно
      window = {
        width = 45, -- Процент от ширины экрана
        position = "float", -- left/right/float/current
        -- height = 0.99,
        -- mappings = {
        -- 	["<space>"] = "none", -- Отключаем стандартный маппинг
        -- },
        popup_border_style = "double", -- NC, shadow, double, single, solid, rounded
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Показывать скрытые файлы
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        }, -- Sidebar автоматически фокусируется на файле, который открыт в главном окне
        use_libuv_file_watcher = true, -- Быстрое обновление дерева при изменениях файлов (libuv вместо стандартного watcher)
        -- hijack_netrw_behavior = "open_current", -- При команде :Explore открывает Neo-tree вместо старого netrw на текущем файле
      },
      -- event_handlers = {
      --   {
      --     event = "file_opened",
      --     handler = function()
      --       require("telescope.builtin").current_buffer_fuzzy_find()
      --     end,
      --   },
      -- },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",

          -- folder_closed = "→",
          -- folder_open = "↓",
          -- folder_empty = "",
        },
      },
    })
  end,
}
-- `popup_border_style` — это лишь одна из множества опций для кастомизации внешнего вида попапов Neo-tree. Можно менять цвета, позиции, размеры, тени и даже анимации для идеального UX в твоей Neovim-конфигурации. [github](https://github.com/nvim-neo-tree/neo-tree.nvim)
--
-- ## Основные опции попапов
-- ```
-- height = 0.8,                 -- 80% высоты экрана
-- winblend = 10,              -- Прозрачность 0-100 (0=полностью прозрачный)
-- popup_style = "minimal",      -- Минималистичный фон
-- popup_border_style = "rounded",        -- Стиль рамки (rounded, double, shadow...)
-- popup_with_border = true,              -- Показывать рамку
-- popup_border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },  -- Кастомные символы
-- use_regular_telescope_popup = false,   -- Использовать Telescope-стиль попапов
-- ```
--
-- ## Полная кастомизация окна Neo-tree
-- ```
-- require("neo-tree").setup({
--   window = {
--     width = 30,                      -- Ширина sidebar
--     mapping_options = { noremap = true, nowait = true },
--     mappings = {                      -- Собственные клавиши в Neo-tree
--       ["<space>"] = "open",
--       ["~"] = "set_root",
--       ["C"] = "set_root_up",
--       ["<cr>"] = "open_drop",
--       ["<c-x>"] = "open_split",
--       ["<c-v>"] = "open_vsplit"
--     }
--   },
--   popup_border_style = "rounded",
--   enable_diagnostics = true,             -- LSP ошибки в sidebar
--   enable_git_status = true,              -- Git статус файлов
--   default_source_selections = {          -- Что показывать по умолчанию
--     sources = { "filesystem", "git_status" }
--   }
-- })
-- ```
--
-- ## Цветовая схема и иконки
-- ```
-- buffers = {
--   follow_current_file = true,
--   group_empty = true,
--   window = {
--     position = "left",                 -- left/right/float
--     mappings = { "buffers" }
--   }
-- },
-- sources = {
--   "filesystem",
--   "buffers",
--   "git_status",
--   "diagnostics"
-- },
-- filesystem = {
--   bind_to_cwd = false,
--   follow_current_file = { enabled = true },
--   use_libuv_file_watcher = true,
--   window = {
--     mappings = {
--       ["gy"] = "copy_node_path",
--       ["gY"] = "copy_node_path_full"
--     }
--   },
--   renderers = {
--     file = {
--       {"icon"},
--       {"name", use_git_status_colors = true},
--       {"diagnostics", symbols = { error = "✗", warning = "⚠" }}
--     }
--   }
-- }
-- ```
--
-- ## Глобальные настройки Neovim для рамок
-- Добавь в init.lua для всех плагинов:
-- ```lua
-- vim.o.winborder = "rounded"            -- Все окна с rounded
-- vim.o.guifont = "JetBrainsMono NF:h14" -- Nerd Font для иконок
-- ```
--
-- **Результат**: Neo-tree с Git-интеграцией, LSP-диагностикой, красивыми попапами и клавишами как в IDE. Sidebar показывает статус файлов, попапы — современный дизайн с твоей цветосхемой. [github](https://github.com/nvim-neo-tree/neo-tree.nvim)
