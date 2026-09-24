vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.cursorline = true

opt.clipboard = "unnamedplus"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.clipboard = "unnamedplus"

-- ======================
-- Keymaps
-- ======================

local keymap = vim.keymap

-- Clear search highlight
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- Save
keymap.set("n", "<leader>w", ":w<CR>")

-- Quit
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "gd", vim.lsp.buf.definition)
-- Asegurarnos de usar true color
vim.opt.termguicolors = true

-- Guardar automáticamente al salir del modo insertar o cambiar de buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true,
})

require('plugins')

-- Toggle NvimTree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap=true, silent=true })

-- Abrir el árbol en la carpeta del proyecto actual
keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap=true, silent=true })

-- ======================
-- Keymaps de Telescope (Estilo Rofi)
-- ======================
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Los que ya tenías de NvimTree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap=true, silent=true })

require('lsp')

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap=true, silent=true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap=true, silent=true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap=true, silent=true })

require('cmp_config')
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
