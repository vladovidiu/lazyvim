return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = function()
    local hostname = io.popen("hostname"):read("*l")
    local openai = require("avante.providers.openai")

    if hostname:match("quasar") then
      -- Work configuration
      return {
        provider = "shopify-ai",
        vendors = {
          ["shopify-ai"] = {
            __inherited_from = "openai",
            api_key_name = "cmd:openai_key cat",
            endpoint = "https://proxy.shopify.ai/v3/v1",
            model = "anthropic:claude-3-5-sonnet",
          },
        },
      }
    else
      -- Personal configuration
      return {
        provider = "ollama",
        vendors = {
          ollama = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "qwq",
          },
        },
      }
    end
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  config = function(_, opts)
    require("avante").setup(opts)
  end,
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.icons",
    "zbirenbaum/copilot.lua", -- for providers=''
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
