return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      sorbet = {},
    },
  },
  setup = {
    sorbet = function()
      local function sorbet_root_pattern(...)
        local patterns = { "sorbet/config" }
        return require("lspconfig.util").root_pattern(unpack(patterns))(...)
      end
      require("lspconfig").sorbet.setup({
        cmd = { "srb", "tc", "--lsp" },
        filetypes = { "ruby" },
        root_dir = function(fname)
          return sorbet_root_pattern(fname)
        end,
      })
    end,
  },
}
