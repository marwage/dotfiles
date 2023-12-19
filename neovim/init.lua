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
    "hrsh7th/cmp-nvim-lsp"
})

-- COLOURSCHEME
vim.cmd[[colorscheme sonokai]]
vim.cmd[[hi Normal ctermbg=NONE]] -- black background with sonokai

-- OPTIONS
vim.o.number=true
vim.o.linebreak=true
vim.o.showbreak="+++"
vim.o.showmatch=true -- When a bracket is inserted, briefly jump to the matching one
vim.o.ignorecase=true -- Ignore case in search patterns
vim.o.expandtab=true -- Use the appropriate number of spaces to insert a <Tab>
vim.o.shiftwidth=4
vim.o.smartindent=true
vim.o.softtabstop=4 -- Number of spaces that a <Tab> counts for while performing editing

-- CMP
require("cmp")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP
lspconfig = require("lspconfig")
lspconfig.pylsp.setup {
settings = {
    pylsp = {
    plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },
    },
    },
},
capabilities = capabilities,
}

lspconfig.lua_ls.setup{}
