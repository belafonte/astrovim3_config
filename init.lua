return {

  -- { "rebelot/heirline.nvim", enabled = false },

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "everforest",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- filmer = function(client)
      --   -- disable formatting for tsserver
      --   if client.name == "tsserver" then return false end
      --
      --   return true
      -- end,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally

        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "ruby",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
      -- tailwindcss = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
    },
    config = {
      cssls = {
        settings = {
          css = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
          scss = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
          less = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
        },
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- telescopePickers.prettyGrepPicker { picker = "live_grep" }

    -- Disable buffer and git tabs in NeoTree
    -- vim.g.neotree_show_buffer = 0
    -- vim.g.neotree_git_hl = 0
    -- require("astronvim.utils.lsp").setup("cssls", {
    --   settings = {
    --     css = { validate = true, lint = {
    --       unknownAtRules = "ignore",
    --     } },
    --     scss = { validate = true, lint = {
    --       unknownAtRules = "ignore",
    --     } },
    --     less = { validate = true, lint = {
    --       unknownAtRules = "ignore",
    --     } },
    --   },
    -- })

    if vim.g.neovide then
      -- Put anything you want to happen only in Neovide here
      vim.opt.guifont = { "FiraCode Nerd Font", ":h12" }
      vim.g.neovide_scale_factor = 1.0
      vim.g.neovide_input_macos_alt_is_meta = true
      vim.g.neovide_cursor_animate_command_line = false
      vim.g.neovide_cursor_animation_length = 0.1
      vim.g.neovide_input_use_logo = true
    end

    -- -- add auto change line numbers
    -- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    --   callback = function() vim.opt.relativenumber = false end,
    -- })
    --
    --
    --
    -- vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true, silent = true })

    -- Execute the Vim command
    -- vim.cmd(vim_command)

    -- add auto change line numbers
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      callback = function() vim.opt.relativenumber = false end,
    })

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      callback = function() vim.opt.relativenumber = true end,
    })

    vim.api.nvim_create_autocmd({ "BufRead" }, {
      callback = function() vim.api.nvim_command "normal bsi" end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
      callback = function()
        if vim.bo.filetype ~= "neo-tree" and vim.fn.bufname ~= "[No Name]" then vim.api.nvim_command "normal zz" end
      end,
    })

    -- -- Define a variable to track the autocmd status
    -- local autocmd_enabled = true
    --
    -- -- Create the autocmd
    -- vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    --   callback = function()
    --     -- Check if the autocmd is enabled
    --     if autocmd_enabled and vim.bo.filetype ~= "neotree" then vim.api.nvim_command "normal zz" end
    --   end,
    -- })

    -- Function to toggle the autocmd status
    -- local function toggle_autocmd() autocmd_enabled = not autocmd_enabled end

    -- Map <leader>ubz to toggle the autocmd status
    -- vim.api.nvim_set_keymap("n", "<leader>uz", "<cmd>lua toggle_autocmd()<CR>", { noremap = true, silent = true })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
