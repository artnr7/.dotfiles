-- Основные настройки
vim.g.mapleader = "," -- Устанавливаем лидер-клавишу
vim.g.maplocalleader = ","
vim.g.have_nerd_font = true
vim.cmd(
  "set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
)
vim.opt.nu = true
-- vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor =
  "n-i-c-v-ci-sm-ve:ver80,r-cr-o:hor20,a:blinkwait700-blinkoff25-blinkon25-Cursor/lCursor"
vim.opt.history = 500
vim.o.undofile = true -- сохранять undo файлы
vim.o.undodir = vim.fn.stdpath("state") .. "/undo" -- ~/.local/state/nvim/undo/
vim.o.undolevels = 10000 -- 10k изменений
vim.o.undoreload = 10000 -- при перезагрузке файла
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Прозрачный фон
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
