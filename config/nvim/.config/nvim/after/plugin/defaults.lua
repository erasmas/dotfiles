local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "


opt.autowrite   = true
opt.breakindent = true -- Enable break indent
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.expandtab 	= true  -- Use spaces instead of tabs
opt.hlsearch = true -- Set highlight on search
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.mouse = "a" -- Enable mouse mode
opt.number = false -- Make line numbers default
opt.relativenumber = false -- Make relative number default
opt.shiftwidth  = 2     -- spaces for tabs when autoindent
opt.signcolumn = "yes" -- Always show sign column
opt.smartcase = true -- Smart case
opt.softtabstop = 2     -- spaces for tabs when editing
opt.tabstop 	  = 2     -- Visual spaces per tab
opt.termguicolors = true -- Enable colors in terminal
opt.timeoutlen = 300	-- Time in milliseconds to wait for a mapped sequence to complete.
opt.undofile = true --Save undo history
opt.updatetime = 250 -- Decrease update time


-- Make it obvious where 100 chars is
opt.textwidth = 100
opt.colorcolumn = '+1'

-- WildIgnore
opt.wildignore:append '*/.git/*'
opt.wildignore:append '*/.DS_Store'
opt.wildignore:append '*/vendor/*'
opt.wildignore:append '*/doc/*'
opt.wildignore:append '*/tmp/*'
opt.wildignore:append '*/deps/*'


-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

