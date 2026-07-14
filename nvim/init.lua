-- LEADER (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- LAZY PACKAGE MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
  { "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
  "ibhagwan/fzf-lua",
  "lewis6991/gitsigns.nvim",
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
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) > 0 then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})

-- lSP
require("lsp")

-- TREESITTER
require("nvim-treesitter").install({
  "bash", "c", "cpp", "go", "javascript", "json", "lua", "markdown",
  "markdown_inline", "nix", "python", "rust", "toml", "typescript", "yaml",
})
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- GITSIGNS
require("gitsigns").setup()

-- KEYMAP
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
local fzf = require("fzf-lua")
vim.keymap.set("n", "<Leader>f", fzf.files)
vim.keymap.set("n", "<Leader>g", fzf.live_grep)
vim.keymap.set("n", "<Leader>b", fzf.buffers)
