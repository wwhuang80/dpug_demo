-- Init
local optl = vim.opt_local
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local skeleton = "$HOME/.config/nvim/templates/skeleton"

-- Python: create/format Python files with these defaults
autocmd({ "FileType" }, {
  pattern = "python",
  group = augroup("Python", { clear = true }),
  callback = function()
    -- PEP8 standards
    optl.tabstop = 4
    optl.softtabstop = 4
    optl.shiftwidth = 4
  end
})

-- Skeleton files: use a template when creating a particular file
autocmd({ "BufNewFile" }, {
  pattern = { "*.py" },
  group = augroup("Skeleton", { clear = true }),
  command = "0r " .. vim.fn.expand(skeleton .. ".%:e")
})

