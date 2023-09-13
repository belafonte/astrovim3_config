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
      filter = function(client)
        -- disable formatting for tsserver
        if client.name == "tsserver" then return false end

        return true
      end,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
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
    -- Disable buffer and git tabs in NeoTree
    -- vim.g.neotree_show_buffer = 0
    -- vim.g.neotree_git_hl = 0

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

    -- local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
    -- local background_color = normal_hl.background
    -- local normal_highlight = vim.api.nvim_get_hl_by_name("Normal", true)
    -- local normal_fg_color = normal_highlight.foreground

    -- local comment_highlight = vim.api.nvim_get_hl_by_name("Comment", true)
    -- local comment_fg_color = comment_highlight.foreground
    --
    -- -- Define the Vim command string with concatenated variable values
    -- -- autocmd ColorScheme * hi BufferLineSeparator guifg='bg' guibg='bg'
    -- local vim_command = string.format(
    --   [[
    --     autocmd ColorScheme * hi NeoTreeNormal guibg=NONE ctermbg=NONE
    --     autocmd ColorScheme * hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
    --
    --     autocmd ColorScheme * hi BufferLineFill guifg='bg' guibg='bg'
    --     autocmd ColorScheme * hi BufferLineOffsetSeparator guifg='#000000' guibg='bg'
    --
    --     autocmd ColorScheme * hi ToggleTerm101NormalFloat guifg='bg' guibg='bg'
    --     autocmd ColorScheme * hi ToggleTerm1NormalFloat guifg='bg' guibg='bg'
    --     autocmd ColorScheme * hi ToggleTerm2NormalFloat guifg='bg' guibg='bg'
    --
    --     autocmd ColorScheme * hi NeotreeTabActive guifg=%s guibg='bg'
    --     autocmd ColorScheme * hi NeotreeTabInactive guifg=%s guibg='bg'
    --     autocmd ColorScheme * hi NeoTreeTabSeparatorInactive guifg=bg guibg='bg'
    --     autocmd ColorScheme * hi NeoTreeTabSeparatorActive guifg=bg guibg='bg'
    --   ]],
    --   normal_fg_color,
    --   comment_fg_color
    -- )

    -- Execute the Vim command
    -- vim.cmd(vim_command)

    -- add auto change line numbers
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      callback = function() vim.opt.relativenumber = false end,
    })

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      callback = function() vim.opt.relativenumber = true end,
    })

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
