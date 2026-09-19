return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts_configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "markdown" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
