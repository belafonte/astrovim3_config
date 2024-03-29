-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- `community.lua` ensures language servers via their language packs
        -- "marksman", -- Markdown structure (also in markdown pack)
        -- "solargraph",
        -- "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- `community.lua` ensures lint and format tools via their language packs
        -- "prettier", -- too agressive
        -- "alex", -- neutral language lint
        -- "markdownlint", -- markdown lint & format (not in markdown pack)
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
-- -- customize mason plugins
-- return {
--   {
--     "williamboman/mason-lspconfig.nvim",
--     opts = {
--       ensure_installed = {
--         "clangd",
--         "cssls",
--         "html",
--         "intelephense",
--         "marksman",
--         "jsonls",
--         "pyright",
--         "lua_ls",
--         "taplo",
--         "texlab",
--         "tsserver",
--         "yamlls",
--       },
--     },
--   },
--   {
--     "jay-babu/mason-null-ls.nvim",
--     opts = {
--       ensure_installed = {
--         "shellcheck",
--         "stylua",
--         "black",
--         "isort",
--         "prettierd",
--         "shfmt",
--       },
--       handlers = {
--         taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
--       },
--     },
--   },
--   {
--     "jay-babu/mason-nvim-dap.nvim",
--     -- overrides `require("mason-nvim-dap").setup(...)`
--     opts = {
--       -- ensure_installed = { "python" },
--     },
--   },
-- }
-- -- customize mason plugins
-- return {
--   {
--     "williamboman/mason-lspconfig.nvim",
--     opts = {
--       ensure_installed = {
--         "clangd",
--         "cssls",
--         "html",
--         "intelephense",
--         "marksman",
--         "jsonls",
--         "pyright",
--         "lua_ls",
--         "taplo",
--         "texlab",
--         "tsserver",
--         "yamlls",
--       },
--     },
--   },
--   {
--     "jay-babu/mason-null-ls.nvim",
--     opts = {
--       ensure_installed = {
--         "shellcheck",
--         "stylua",
--         "black",
--         "isort",
--         "prettierd",
--         "shfmt",
--       },
--       handlers = {
--         taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
--       },
--     },
--   },
--   {
--     "jay-babu/mason-nvim-dap.nvim",
--     -- overrides `require("mason-nvim-dap").setup(...)`
--     opts = {
--       -- ensure_installed = { "python" },
--     },
--   },
-- }
