local configModule = require("onedark.config")
local colors = require("onedark.colors").setup(configModule.config)
local util = require("onedark.util")

local onedark_spacemacs = {}

local dark_fg_gutter = util.darken(colors.fg_gutter,0.4)

onedark_spacemacs.normal = {
  a = { bg = "DarkGoldenRod2", fg = colors.black },
  b = { bg = dark_fg_gutter, fg = "DarkGoldenRod2" },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

onedark_spacemacs.insert = {
  a = { bg = "chartreuse3", fg = colors.black },
  b = { bg = dark_fg_gutter, fg = "chartreuse3" },
}

onedark_spacemacs.command = {
  a = { bg = "SkyBlue2", fg = colors.black },
  b = { bg = dark_fg_gutter, fg = "SkyBlue2" },
}

onedark_spacemacs.visual = {
  a = { bg = "gray", fg = colors.black },
  b = { bg = dark_fg_gutter, fg = "gray" },
}

onedark_spacemacs.replace = {
  a = { bg = "chocolate", fg = colors.black },
  b = { bg = dark_fg_gutter, fg = "chocolate" },
}

onedark_spacemacs.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = dark_fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = dark_fg_gutter },
}

return onedark_spacemacs
