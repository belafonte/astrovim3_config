return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
    ignore_lsp = { "lua_ls", "julials" },
  },
  config = function(_, opts) require("project_nvim").setup(opts) end,
}
