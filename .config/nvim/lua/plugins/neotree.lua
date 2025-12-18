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
      auto_clean_after_session_restore = false,
      close_if_last_window = true, -- Закрыть neo-tree, если это последнее окно
      window = {
        width = 25,
        -- mappings = {
        -- 	["<space>"] = "none", -- Отключаем стандартный маппинг
        -- },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Показывать скрытые файлы
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Автоматически фокусироваться на текущем файле
        },
      },
      default_component_configs = {
        icon = {
          -- folder_closed = "",
          -- folder_open = "",
          -- folder_empty = "",

          folder_closed = "→",
          folder_open = "↓",
          folder_empty = "",
        },
      },
    })
  end,
}
