-- Ну шо бы кнопочкой d удалять, а не вырезать
return {
  "gbprod/cutlass.nvim",
  opts = {
    cut_key = "x",
    override_del = nil,
    exclude = {},
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  },
}
