-- ══════════════════════════════════════════
-- SITH OS — Neovim Configuration
-- ══════════════════════════════════════════

-- Options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false

-- Custom Sith Cyberpunk colorscheme
local function sith_colors()
    local colors = {
        bg = "#080112",
        bg2 = "#0f031e",
        bg3 = "#1a0535",
        fg = "#e6dcff",
        purple = "#b400ff",
        red = "#ff0033",
        pink = "#ff0050",
        cyan = "#00ffc8",
        amber = "#ffaa00",
        shadow = "#5a00b4",
        dim = "#6e5494",
    }

    -- Base
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.purple, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.cyan, bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.dim })
    vim.api.nvim_set_hl(0, "Visual", { bg = colors.bg3 })
    vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.amber })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.cyan })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.dim, bg = colors.bg })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.bg3 })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.bg, bg = colors.purple })
    vim.api.nvim_set_hl(0, "TabLine", { fg = colors.dim, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.cyan, bg = colors.bg3, bold = true })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.bg })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
    vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.dim, bg = colors.bg })
    vim.api.nvim_set_hl(0, "Folded", { fg = colors.dim, bg = colors.bg2 })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.cyan, bold = true, underline = true })
    vim.api.nvim_set_hl(0, "Directory", { fg = colors.purple })
    vim.api.nvim_set_hl(0, "Title", { fg = colors.purple, bold = true })

    -- Syntax
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.dim, italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.cyan })
    vim.api.nvim_set_hl(0, "String", { fg = colors.cyan })
    vim.api.nvim_set_hl(0, "Character", { fg = colors.cyan })
    vim.api.nvim_set_hl(0, "Number", { fg = colors.amber })
    vim.api.nvim_set_hl(0, "Boolean", { fg = colors.amber })
    vim.api.nvim_set_hl(0, "Float", { fg = colors.amber })
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.purple, bold = true })
    vim.api.nvim_set_hl(0, "Statement", { fg = colors.red })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.red, bold = true })
    vim.api.nvim_set_hl(0, "Operator", { fg = colors.pink })
    vim.api.nvim_set_hl(0, "PreProc", { fg = colors.amber })
    vim.api.nvim_set_hl(0, "Include", { fg = colors.purple })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.purple })
    vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.red })
    vim.api.nvim_set_hl(0, "Structure", { fg = colors.purple })
    vim.api.nvim_set_hl(0, "Special", { fg = colors.pink })
    vim.api.nvim_set_hl(0, "Error", { fg = colors.red, bold = true })
    vim.api.nvim_set_hl(0, "Todo", { fg = colors.amber, bold = true })
    vim.api.nvim_set_hl(0, "Underlined", { fg = colors.cyan, underline = true })

    -- Diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.amber })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.cyan })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.purple })

    -- Diff
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.cyan, bg = "#002a20" })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.amber, bg = "#1a1500" })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red, bg = "#1a0010" })
    vim.api.nvim_set_hl(0, "DiffText", { fg = colors.amber, bg = "#332a00", bold = true })
end

sith_colors()

-- Statusline
vim.opt.statusline = table.concat({
    " %#PmenuSel# ",      -- mode color
    " %f",                  -- filename
    " %m",                  -- modified flag
    "%=",                   -- right align
    " %{&filetype} ",      -- filetype
    " %#PmenuSel# ",
    " %l:%c ",             -- line:col
    " %p%% ",              -- percentage
})

-- Keymaps
local map = vim.keymap.set
-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
-- Quick quit
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
-- File explorer
map("n", "<leader>e", "<cmd>Explore<CR>", { desc = "File explorer" })
-- Split navigation
map("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal split" })

-- NetRW (file explorer) settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25
