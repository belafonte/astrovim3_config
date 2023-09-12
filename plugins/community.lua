local utils = require "astronvim.utils"
-- AstroCommunity plugins
-- https://github.com/AstroNvim/astrocommunity

return {
  -- ----------------------------------------------
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",

  -- Test changes in local copy of astrocommunity (fork of project)
  -- uses ~/project/astrocommunity
  -- {
  --   "AstroNvim/astrocommunity",
  --   dev = true,
  -- },
  -- local plugins in path
  -- { dir = "~/projects/community/neovim/astrocommunity" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Diagnostics

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- ----------------------------------------------
  -- Bars and Lines
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        themable = true,
        -- style_preset = "minimal",
        always_show_bufferline = false,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            -- padding = 1,
            separator = true,
          },
        },
        -- highlights = {
        --   fill = {
        --     guifg = "#100e23",
        --     guibg = "#87DFEB",
        --   },
        --   tab = {
        --     fg = "#100e23",
        --     bg = "#87DFEB",
        --   },
        --   background = {
        --     fg = "#100e23",
        --     bg = "#87DFEB",
        --   },
        -- },
      },
    },
  },

  { import = "astrocommunity.bars-and-lines.scope-nvim" },

  -- ----------------------------------------------
  -- color
  -- color picker and highlighter
  { import = "astrocommunity.color.ccc-nvim" },

  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Motion plugins
  -- :help nvim-surround.usage.
  { import = "astrocommunity.motion.nvim-surround" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Editor support
  -- Rainbow parens
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  {
    "folke/todo-comments.nvim",
    opts = {
      sign_priority = 5, -- higher sign display priority
    },
  },

  -- ----------------------------------------------
  -- Distraction free editing
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- override default configuration
      -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
      plugins = {
        options = {
          enabled = true,
        },
        kitty = {
          enabled = true,
          font = "+4", -- font size increment
        },
      },
    },
  },
  -- ----------------------------------------------
  --

  -- ----------------------------------------------
  -- Motion
  -- Navigate with search labels
  { import = "astrocommunity.motion.flash-nvim" }, -- overrides S surround in visual state
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Packs
  -- Treesitter: clojure , Lsp: clojure-lsp, Lint/format:
  { import = "astrocommunity.pack.clojure" },
  -- Treesitter: dockerfile , Lsp: dockerls & docker_compose_language_service, Lint/format: hadolint
  { import = "astrocommunity.pack.docker" },
  -- Treesitter: json & jsonc, Lsp: jsonls, Lint/format: stylua
  { import = "astrocommunity.pack.json" },
  -- Treesitter: lua, Lsp: lua_ls, Lint/format: stylua
  { import = "astrocommunity.pack.lua" },

  -- This plugin does the following
  -- Adds 'ruby' treesitter parser
  -- Adds 'solargraph' language server
  -- Adds 'standardrb' through null-ls
  -- Adds 'nvim-dap-ruby'
  -- DOES NOT WORK -> LSP TIMEOUT
  -- { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },

  -- Pack not used as prettierd too agressive with format
  -- Treesitter: markdown & markdown_inline, Lsp: marksman, Lint/format: prettierd
  -- { import = "astrocommunity.pack.markdown" },
  -- Treesitter: markdown & markdown_inline, Lsp: marksman, Lint/format: prettierd
  -- { import = "astrocommunity.pack.yaml" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Project
  { import = "astrocommunity.project.project-nvim" }, -- switch between projects
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Programing Language support
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- registers
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  -- ----------------------------------------------
  --

  -- ----------------------------------------------
  -- scrolling
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },

  -- ----------------------------------------------
  -- Themes
  -- defined in themes.lua
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Utility
  -- rich command prompt
  { import = "astrocommunity.utility.noice-nvim" },

  -- Version Control
  -- defined in plugins/git.lua

  -- { "max397574/better-escape.nvim", enabled = false },
  -- ----------------------------------------------
}
