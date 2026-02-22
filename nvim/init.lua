-- LAZY PACKAGE MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "sainnhe/sonokai",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "numToStr/Comment.nvim",
  "github/copilot.vim",
})

-- COLOURSCHEME
vim.g.sonokai_transparent_background = 1
vim.cmd [[colorscheme sonokai]]

-- OPTIONS
vim.opt.number = true
vim.opt.linebreak = true
vim.opt.showbreak = "+++"
vim.opt.showmatch = true  -- When a bracket is inserted, briefly jump to the matching one
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.expandtab = true  -- Use the appropriate number of spaces to insert a <Tab>
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "" -- No mouse support

-- FORMAT ON SAVE
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- lSP
require("lsp")

-- COMMENT
require('Comment').setup()

-- KEYMAP
vim.diagnostic.enable(true)
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", {})
