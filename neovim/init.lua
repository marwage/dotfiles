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

require("lazy").setup({"sainnhe/sonokai"})

vim.cmd "colorscheme sonokai"
vim.cmd "hi Normal ctermbg=NONE" -- black background with sonokai

vim.o.number=true
vim.o.linebreak=true
vim.o.showbreak="+++"
vim.o.showmatch=true -- When a bracket is inserted, briefly jump to the matching one
vim.o.ignorecase=true -- Ignore case in search patterns
vim.o.shiftwidth=4
vim.o.smartindent=true
vim.o.softtabstop=4 -- Number of spaces that a <Tab> counts for while performing editing
