-- Ну шо бы кнопочкой d удалять, а не вырезать
return {
  {
    "gbprod/cutlass.nvim",
    opts = {
      {
        cut_key = x,
        override_del = nil,
        exclude = {},
        registers = {
          select = "_",
          delete = "_",
          change = "_",
        },
      },
      -- your configuration comes here
      -- or don't set opts to use the default settings
      -- refer to the configuration section below
    },
  },
}
