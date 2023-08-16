return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      -- vim.cmd.colorscheme("tokyonight-moon")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      -- vim.cmd.colorscheme("tokyonight-day")
      --
    end,
  },
  config = function(_, opts) require("auto-dark-mode").setup(opts) end,
  init = function(_) require("auto-dark-mode").init() end,
}
