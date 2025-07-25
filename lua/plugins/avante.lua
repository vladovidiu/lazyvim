return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = function()
    local hostname = io.popen("hostname"):read("*l")

    if hostname:match("quasar") then
      -- Work configuration
      return {
        web_search_engine = {
          provider = "kagi",
        },
        provider = "shopify-ai",
        providers = {
          ["shopify-ai"] = {
            __inherited_from = "openai",
            -- api_key_name = "cmd:openai_key cat",
            endpoint = "https://proxy-shopify-ai.local.shop.dev/v1",
            model = "anthropic:claude-sonnet-4",
            -- model = "deepseek:r1",
          },
        },
      }
    else
      -- Personal configuration
      return {
        provider = "openrouter",
        providers = {
          ollama = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "qwq",
          },
          openrouter = {
            __inherited_from = "openai",
            endpoint = "https://openrouter.ai/api/v1",
            api_key_name = "OPENROUTER_API_KEY",
            model = "anthropic/claude-sonnet-4",
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

    {
      "zbirenbaum/copilot.lua", -- for providers=''
      event = "VeryLazy",
    },
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
