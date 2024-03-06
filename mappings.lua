-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- local utils = require "user.utils"
local astro_utils = require "astronvim.utils"

return {
  -- first key is the mode
  v = {
    ["<leader>i"] = { desc = "Summon ChatGPT" },
    ["<leader>ic"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    ["<leader>ie"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    ["<leader>ig"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    ["<leader>it"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    ["<leader>ik"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    ["<leader>id"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    ["<leader>ia"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    ["<leader>io"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    ["<leader>is"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    ["<leader>if"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    ["<leader>ix"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    ["<leader>ir"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    ["<leader>il"] = {
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      desc = "Code Readability Analysis",
    },
  },
  -- i = {
  --   ["<leader>ii"] = { "<cmd>ChatGPTCompleteCode<CR>", desc = "Complete Code" },
  -- },
  n = {
    -- MANAGE PACKAGE DEPS
    ["<leader>pd"] = { desc = "NPM Packages" },
    ["<leader>pdl"] = { "<cmd>lua require('package-info').show()<cr>", desc = "Show Latest Version" },
    ["<leader>pdd"] = { "<cmd>lua require('package-info').delete()<cr>", desc = "Delete Package" },
    ["<leader>pdu"] = { "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Package Version" },
    ["<leader>pdi"] = { "<cmd>lua require('package-info').install()<cr>", desc = "Install new Package" },

    ["<C-u>"] = { "<C-u>zz", desc = "Half Page up + Center" },
    ["<C-d>"] = { "<C-d>zz", desc = "Half Page down + Center" },
    -- ["j"] = { "j zz", desc = "Down + Center" },
    -- ["k"] = { "k zz", desc = "Up + Center" },
    -- ["<U>"] = { "<cmd>Uzz<cr>", desc = "Increase window height" },

    ["<M-Up>"] = { "<cmd>resize +2<cr>", desc = "Increase window height" },
    ["<M-Down>"] = { "<cmd>resize -2<cr>", desc = "Decrease window height" },
    ["<M-Left>"] = { "<cmd>vertical resize +2<cr>", desc = "Decrease window width" },
    ["<M-Right>"] = { "<cmd>vertical resize -2<cr>", desc = "Increase window width" },

    ["<leader>i"] = { desc = "Summon ChatGPT" },
    ["<leader>ii"] = { "<cmd>ChatGPTCompleteCode<CR>", desc = "Complete Code" },
    ["<leader>ic"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    ["<leader>ie"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    ["<leader>ig"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    ["<leader>it"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    ["<leader>ik"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    ["<leader>id"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    ["<leader>ia"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    ["<leader>io"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    ["<leader>is"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    ["<leader>if"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    ["<leader>ix"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    ["<leader>ir"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    ["<leader>il"] = {
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      desc = "Code Readability Analysis",
    },

    -- [[ ["<leader>Q"] = {
    --   function()
    --     require("astronvim.utils.buffer").close_all()
    --     vim.cmd "q!"
    --   end,
    --   desc = "Quit All",
    -- }, ]]

    ["<leader>bv"] = {
      "<cmd>silent! windo if winnr('$') > 1 | execute 'bdelete ' . join(filter(range(1, bufnr('$')), 'bufwinnr(v:val) < 0')) | endif<CR>",
      desc = "Close Buffers beside open ones",
    },

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
    -- ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
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
