return {
  {
    "L3MON4D3/LuaSnip",

    build = "make install_jsregexp",
    dependencies = {
      "iurimateus/luasnip-latex-snippets.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local ls = require("luasnip")

      ls.config.setup({ enable_autosnippets = true})

      require("luasnip-latex-snippets").setup({
        use_treesitter = false,
        allow_on_enter = true,
      })

      vim.keymap.set({"i", "s"}, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, {silent = true})

      vim.keymap.set({"i", "s"}, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, {silent = true})
    end,
  }
}
