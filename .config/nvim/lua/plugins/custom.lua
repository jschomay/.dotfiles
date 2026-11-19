return {
  { "tpope/vim-fugitive" },

  { "EdenEast/nightfox.nvim" },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = true,
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "saghen/blink.cmp",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          auto_show_delay_ms = 1000,
        },
        documentation = {
          auto_show = true,
          update_delay_ms = 500,
          auto_show_delay_ms = 500,
        },
        ghost_text = {
          enabled = false,
          -- enabled = vim.g.ai_cmp,
        },
      },

      -- cmdline = {
      --   enabled = true,
      -- },

      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {
          discover_files = function(path)
            return vim.fn.globpath(path, "**/test/*.js", false, true) -- adjust as needed
          end,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "adrigzr/neotest-mocha" },
    opts = {
      adapters = {
        -- ["neotest-mocha"] = {
        --   command = "npm test --",
        --   command_args = function(context)
        --     -- The context contains:
        --     --   results_path: The file that json results are written to
        --     --   test_name: The exact name of the test; is empty for `file` and `dir` position tests.
        --     --   test_name_pattern: The generated pattern for the test
        --     --   path: The path to the test file
        --     --
        --     -- It should return a string array of arguments
        --     --
        --     -- Not specifying 'command_args' will use the defaults below
        --     return {
        --       "--full-trace",
        --       "--reporter=json",
        --       "--reporter-options=output=" .. context.results_path,
        --       "--grep=" .. context.test_name_pattern,
        --       context.path,
        --     }
        --   end,
        --   env = { CI = true },
        --   cwd = function(path)
        --     return vim.fn.getcwd()
        --   end,
        -- },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.05,
      },
    },
  },
}
