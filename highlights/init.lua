local comment_highlight = vim.api.nvim_get_hl_by_name("Comment", true)
local comment_fg_color = comment_highlight.foreground
local comment_bg_color = comment_highlight.background

local normal_highlight = vim.api.nvim_get_hl_by_name("Normal", true)
local normal_fg_color = comment_highlight.foreground
local normal_bg_color = comment_highlight.background

return { -- this table overrides highlights in all themes
  -- Normal = { bg = comment_fg_color },
  -- BufferLineFill = { bg = "bg" },
  -- BufferLineOffsetSeparator = { fg = comment_bg_color, bg = "bg" },

  NeoTreeNormal = { bg = "bg" },
  NeoTreeEndOfBuffer = { bg = "bg" },
  NormalFloat = { bg = "bg" },
  Normal = { bg = "bg" },
  FloatBorder = { bg = "bg" },

  NeotreeTabActive = { bg = "bg" },
  NeotreeTabInactive = { bg = "bg" },
  NeoTreeTabSeparatorInactive = { fg = "bg", bg = "bg" },
  NeoTreeTabSeparatorActive = { fg = "bg", bg = "bg" },

  -- NeoTreeNormal = {}guibg=NONE ctermbg=NONE
  -- NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
}
