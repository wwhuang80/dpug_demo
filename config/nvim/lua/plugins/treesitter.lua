-- Tree-sitter configuration. Tree-sitter is a parser that builds syntax trees
-- for source files. IDEs can send those trees to a language server and get
-- information about syntax highlighting, possible completions, etc.
return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local cfg = require("nvim-treesitter.configs")
    cfg.setup({
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "vim",
        "python",
      }
    })
  end
}
