-- Language Server Protocol (LSP) configuration, which enables IDEs to use code
-- completions, syntax highlighting, linting, etc.

-- Global config for diagnostics
vim.diagnostic.config({
  virtual_text = {
    severity_sort = true
  },
  signs = false,
  update_in_insert = false
})

-- LSP config
local cfg = function()
  local lsp = require('lspconfig')

  -- Python
  lsp.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {
              'E203',             -- Whitespace before ','
              'W391',             -- Blank line at end of file
            }
          }
        }
      }
    }
  }

end

return {
  {
    'folke/neodev.nvim',
    name = 'neodev',
    opts = {
      setup_jsonls = true
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'pylsp',
      }
    }
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      {
        'folke/neodev.nvim',
        name = 'neodev',
        lazy = false
      },
    },
    config = cfg
  }
}
