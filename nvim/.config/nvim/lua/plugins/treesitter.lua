return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts_configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "markdown", "java", "latex"},
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
