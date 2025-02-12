return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = { enabled = true },
    },
    keys = {
      {
        "<c-\\>",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
      {
        "<c-_>",
        function()
          Snacks.terminal()
        end,
        desc = "which_key_ignore",
      },
    },
  },
}
