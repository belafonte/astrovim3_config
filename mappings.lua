-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- local utils = require "user.utils"
local astro_utils = require "astronvim.utils"

return {
  -- first key is the mode
  n = {
    -- MANAGE PACKAGE DEPS
    ["<leader>pd"] = { desc = "NPM Packages" },
    ["<leader>pdl"] = { "<cmd>lua require('package-info').show()<cr>", desc = "Show Latest Version" },
    ["<leader>pdd"] = { "<cmd>lua require('package-info').delete()<cr>", desc = "Delete Package" },
    ["<leader>pdu"] = { "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Package Version" },
    ["<leader>pdi"] = { "<cmd>lua require('package-info').install()<cr>", desc = "Install new Package" },

    ["<C-u>"] = { "<C-u>zz", desc = "Half Page up + Center" },
    ["<C-d>"] = { "<C-d>zz", desc = "Half Page down + Center" },
    -- ["<U>"] = { "<cmd>Uzz<cr>", desc = "Increase window height" },

    ["<M-Up>"] = { "<cmd>resize +2<cr>", desc = "Increase window height" },
    ["<M-Down>"] = { "<cmd>resize -2<cr>", desc = "Decrease window height" },
    ["<M-Left>"] = { "<cmd>vertical resize +2<cr>", desc = "Decrease window width" },
    ["<M-Right>"] = { "<cmd>vertical resize -2<cr>", desc = "Increase window width" },
    -- [[ ["<leader>Q"] = {
    --   function()
    --     require("astronvim.utils.buffer").close_all()
    --     vim.cmd "q!"
    --   end,
    --   desc = "Quit All",
    -- }, ]]

    -- Save All
    ["<leader>W"] = { "<cmd>wa<cr>", desc = "Save All" },
    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- buffer switching
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },

    -- ["<leader>ts"] = {
    --   "<cmd>:TermSelect<cr>",
    --   desc = "Select Terminals",
    -- },
    -- ["<leader>tm"] = {
    --   desc = "Multiple Terminals",
    -- },
    -- ["<leader>tmv"] = {
    --   "<cmd>:TermExec direction=vertical size=50 cmd='clear'<cr><cmd>:2TermExec direction=vertical size=50 cmd='clear'<cr>",
    --   desc = "2 Vertical Stacked Terminals",
    -- },
    -- ["<leader>tmt"] = {
    --   "<cmd>:3TermExec direction=vertical size=50 cmd='clear'<cr>",
    --   desc = "Add Third Vertical Terminal",
    -- },
    --
    -- ["<leader>tmh"] = {
    --   "<cmd>:TermExec direction=horizontal size=50 cmd='clear'<cr><cmd>:2TermExec direction=horizontal size=50 cmd='clear'<cr>",
    --   desc = "2 Horizontal Terminals",
    -- },

    t = {
      ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
      ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
  },
}
