local util = require('onedark.util')
local colors = require('onedark.colors')
local configModule = require('onedark.config')

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or configModule.config

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = { -- luacheck: ignore
    Comment = { fg = c.fg_gutter, style = config.commentStyle }, -- any comment
    ColorColumn = { bg = c.bg_visual }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.fg_gutter }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_light }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = config.hideNonText and c.bg or c.fg_dark }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.black }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.black }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.fg_gutter }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.dark5 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.blue, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, style = 'bold' }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.bg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border_highlight },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, style = 'bold' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg_search }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.fg_gutter }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = 'undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = 'undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    WinBar = { fg = c.fg, bg = c.bg, style = 'bold' },
    WinBarNC = { fg = c.fg, bg = c.bg },
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.orange }, -- (preferred) any constant
    String = { fg = c.green }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    Boolean = { fg = c.orange }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.red, style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.blue, style = config.functionStyle }, -- function name (also: methods for classes)
    Statement = { fg = c.purple }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.red }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.cyan, style = config.keywordStyle }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.yellow }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.red }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { fg = c.dark5 },
    qfFileName = { fg = c.blue },
    htmlTag = { fg = c.purple, style = 'bold' },
    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.bg2, fg = c.fg },
    mkdCodeDelimiter = { bg = c.bg2, fg = c.fg },
    mkdCodeStart = { fg = c.yellow, style = 'bold' },
    mkdCodeEnd = { fg = c.yellow, style = 'bold' },
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = { fg = c.orange, style = 'bold' },
    markdownCode = { fg = c.yellow },
    markdownCodeBlock = { fg = c.yellow },
    markdownH1 = { fg = c.red, style = 'bold' },
    markdownH2 = { fg = c.blue, style = 'bold' },
    markdownLinkText = { fg = c.blue, style = 'underline' },
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError = { bg = c.none, fg = c.diagnostics.error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { bg = c.none, fg = c.diagnostics.warning }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { bg = c.none, fg = c.diagnostics.info }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { bg = c.none, fg = c.diagnostics.hint }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError = { style = 'undercurl', sp = c.diagnostics.error }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = 'undercurl', sp = c.diagnostics.warning }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = 'undercurl', sp = c.diagnostics.info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = 'undercurl', sp = c.diagnostics.hint }, -- Used to underline "Hint" diagnostics
    LspInlayHint = { fg = c.fg_gutter, bg = c.bg_light },

    ["@lsp.type.macro"] = { link = "@function" },

    -- neovim 0.6.0
    DiagnosticDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultWarn = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultInfo = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError = { bg = c.none, fg = c.diagnostics.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = c.none, fg = c.diagnostics.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = c.none, fg = c.diagnostics.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = c.none, fg = c.diagnostics.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = { style = 'undercurl', sp = c.diagnostics.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = 'undercurl', sp = c.diagnostics.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = 'undercurl', sp = c.diagnostics.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = 'undercurl', sp = c.diagnostics.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.orange, bg = c.bg_visual },

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column
    Blue = {fg = c.blue},
    Cyan = {fg = c.cyan},
    Purple = {fg = c.purple},
    Orange = {fg = c.orange},
    Yellow = {fg = c.yellow},
    Green = {fg = c.green},
    Red = {fg = c.red},
  }

  theme.plugins = {

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean          = { }; -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    ["@text.note"] = { fg = c.bg, bg = c.info },
    ["@text.warning"] = { fg = c.bg, bg = c.warning },
    ["@text.danger"] = { fg = c.bg, bg = c.error },
    ["@constructor"] = { fg = c.yellow }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    ["@constant"] = { fg = c.yellow }, -- For constants
    ["@constant.builtin"] = { fg = c.orange }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { }    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    ["@field"] = { fg = c.cyan }, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    ["@function.call"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.blue },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    ["@function.builtin"] = { fg = c.blue },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    ["@include"] = { fg = c.purple }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    ["@keyword"] = { fg = c.purple, style = config.keywordStyle }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = c.purple, style = config.functionStyle }, -- For keywords used to define a fuction.
    ["@label"] = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    ["@namespace"] = { fg = c.red }, -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    ["@operator"] = { fg = c.cyan }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@parameter"] = { fg = c.red }, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    ["@property"] = { fg = c.red }, -- Same as `TSField`.
    ["@punctuation.delimiter"] = { fg = c.cyan }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.fg_dark }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = c.fg }, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    ["@string.regex"]= { fg = c.orange }, -- For regexes.
    ["@string.escape"] = { fg = c.red }, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    ["@type.builtin"] = { fg = c.yellow },

    ["@tag"] = { fg = c.red }, -- Tags like html tag names.
    ["@tag.delimiter"] = { fg = c.red }, -- Tag delimiter like `<` `>` `/`
    ["@tag.attribute"] = { fg = c.orange, style = config.keywordStyle },
    ["@variable"] = { style = config.variableStyle, fg = c.red }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    ["@text.reference"] = { fg = c.red }, -- FIXME
    ["@text.environment"] = { fg = c.red },
    ["@text.environment.name"] = { fg = c.green },
    ["@text.math"] = { fg = c.yellow },
    -- TSText              = { };    -- For strings considered text in a markup language.
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    -- luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    uiuaConst = { fg = c.orange },
    uiuaShadowConst = { fg = c.fg },
    uiuaPervasiveMonadic = { fg = c.green },
    uiuaPervasiveDyadic = { fg = c.blue },
    uiuaNoadic = { fg = c.red },
    uiuaMonadic = { fg = c.green },
    uiuaDyadic = { fg = c.blue },
    uiuaMonadicMod = { fg = c.yellow },
    uiuaOtherMod = { fg = c.purple },
    uiuaOtherSF = { fg = c.purple },
    uiuaDyadicSF = { fg = c.blue },
    uiuaNoadicSF = { fg = c.red },
    uiuaModifierSF = { fg = c.yellow },
    uiuaNum = { fg = c.orange },
    uiuaStr = { fg = c.cyan },
    uiuaChar = { fg = c.cyan },
    uiuaEsc = { fg = c.cyan },

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.purple, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.fg_gutter },
    diffIndexLine = { fg = c.purple },

    -- Neogit
    NeogitBranch = { fg = c.purple },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = { fg = c.fg_gutter },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_light, bg = c.bg_sidebar },
    NvimTreeEndOfBuffer = config.darkSidebar and { fg = c.bg2 } or { fg = c.bg },
    NvimTreeRootFolder = { fg = c.fg_light, style = 'bold' },
    NvimTreeGitDirty = { fg = c.yellow2 },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.yellow, style = 'underline' },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.purple },
    NvimTreeFolderName = { fg = c.fg_light },
    NvimTreeOpenedFolderName = { fg = c.fg_light, style = 'bold' },
    LspDiagnosticsError = { fg = c.error },
    LspDiagnosticsWarning = { fg = c.warning },
    LspDiagnosticsInformation = { fg = c.info },
    LspDiagnosticsHint = { fg = c.hint },

    -- Dashboard
    DashboardShortCut = { fg = c.purple },
    DashboardHeader = { fg = c.red },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.yellow, style = 'italic' },

    -- WhichKey
    WhichKey = { fg = c.yellow },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.red },
    WhichKeySeperator = { fg = c.fg_gutter },
    WhichKeySeparator = { fg = c.fg_gutter },
    WhichKeyFloat = { bg = c.bg_sidebar },
    WhichKeyValue = { fg = c.dark5 },

    -- LspSaga
    DiagnosticError = { fg = c.error },
    DiagnosticWarning = { fg = c.warning },
    DiagnosticInformation = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    SagaBorder = { fg = c.fg, bg = c.bg2 },
    SagaNormal = { bg = c.bg2 },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.blue },
    BufferLineFill = { bg = c.black },

    -- Barbar
    -- reference: https://github.com/romgrk/barbar.nvim#highlighting

    -- status:
    -- Current: current buffer
    -- Visible: visible but not current buffer
    -- Inactive: invisible but not current buffer

    -- part:
    -- Icon: filetype icon
    -- Index: buffer index
    -- Mod: when modified
    -- Sign: the separator between buffers
    -- Target: letter in buffer-picking mod

    BufferTabpageFill = { bg = c.bg2, fg = c.bg_visual }, -- filler after the buffer section

    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentIndex = { bg = c.bg, fg = c.blue },
    BufferCurrentMod = { bg = c.bg, fg = c.yellow },
    BufferCurrentSign = { link = 'BufferCurrentIndex' },
    BufferCurrentTarget = { bg = c.bg, fg = c.red, style = 'bold' },

    BufferVisible = { bg = c.bg, fg = util.darken(c.fg, 0.8) },
    BufferVisibleIndex = { link = 'BufferCurrentIndex' },
    BufferVisibleMod = { link = 'BufferVisibleMod' },
    BufferVisibleSign = { bg = c.bg, fg = util.darken(c.blue, 0.8) },
    BufferVisibleTarget = { link = 'BufferCurrentTarget' },

    BufferInactive = { bg = c.bg2, fg = util.darken(c.fg, 0.5) },
    BufferInactiveIndex = { bg = c.bg2, fg = util.darken(c.fg, 0.25) },
    BufferInactiveMod = { bg = c.bg2, fg = util.darken(c.yellow, 0.7) },
    BufferInactiveSign = { link = 'BufferInactiveIndex' },
    BufferInactiveTarget = { bg = c.bg2, fg = c.red, style = 'bold' },

    -- ALE
    ALEWarningSign = { fg = c.yellow },
    ALEErrorSign = { fg = c.red },

    -- Hop
    HopNextKey = { fg = c.purple, style = 'bold' },
    HopNextKey1 = { fg = c.blue, style = 'bold' },
    HopNextKey2 = { fg = util.darken(c.blue, 0.3) },
    HopUnmatched = { fg = c.dark5 },

    LightspeedGreyWash = { fg = c.dark5 },

    -- NVIM CMP - VSCode like highlights
    CmpItemAbbrMatch = { fg = c.blue },
    CmpItemAbbrMatchFuzzy = { fg = c.blue },
    CmpItemKindFunction = { fg = c.purple },
    CmpItemKindMethod = { fg = c.purple },
    CmpItemKindVariable = { fg = c.blue },
    CmpItemKindInterface = { fg = c.blue },
    CmpItemKindText = { fg = c.blue },
    CmpItemKindKeyword = { fg = c.dark5 },
    CmpItemAbbrDeprecated = { style = 'strikethrough', fg = c.fg_gutter },

    -- blink.cmp highlights
    BlinkCmpKindSnippet = { fg = c.green },
    BlinkCmpKindField = { fg = c.red },
    BlinkCmpKindFunction = { fg = c.purple },
    BlinkCmpKindMethod = { fg = c.purple },
    BlinkCmpKindOperator = { fg = c.cyan },
    BlinkCmpKindVariable = { fg = c.blue },
    BlinkCmpKindInterface = { fg = c.blue },
    BlinkCmpKindText = { fg = c.fg },
    BlinkCmpKindKeyword = { fg = c.dark5 },
    BlinkCmpKindEnum = { fg = c.yellow },
    BlinkCmpKindStruct = { fg = c.yellow },
    BlinkCmpKindClass = { fg = c.yellow },
    BlinkCmpGhostText = { fg = c.fg_gutter },
    BlinkCmpLabelMatch = { fg = c.blue },
    BlinkCmpMenuSelection = { bg = c.bg_visual },

    NotifyERRORBorder = { fg = c.diagnostics.error },
    NotifyWARNBorder = { fg = c.diagnostics.warn },
    NotifyINFOBorder = { fg = c.diagnostics.info },
    NotifyDEBUGBorder = { fg = c.diagnostics.hint },
    NotifyTRACEBorder = { fg = c.purple },
    NotifyERRORIcon = { fg = c.diagnostics.error },
    NotifyWARNIcon = { fg = c.diagnostics.warn },
    NotifyINFOIcon = { fg = c.diagnostics.info },
    NotifyDEBUGIcon = { fg = c.diagnostics.hint },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyERRORTitle = { fg = c.diagnostics.error },
    NotifyWARNTitle = { fg = c.diagnostics.warn },
    NotifyINFOTitle = { fg = c.diagnostics.info },
    NotifyDEBUGTitle = { fg = c.diagnostics.hint },
    NotifyTRACETitle = { fg = c.purple },

    -- Neorg
    ["@neorg.headings.1.title"] = { fg = c.cyan, style = "bold" },
    ["@neorg.tags.ranged_verbatim.document_meta.title"] = { fg = c.cyan, style = "bold" },
    ["@neorg.headings.1.prefix"] = { link = "@neorg.headings.1.title" },
    ["@neorg.markup.bold"] = { link = "Bold" },
    ["@neorg.markup.italic"] = { link = "Italic" },
    ["@neorg.markup.underline"] = { link = "Underlined" },
    ["@neorg.quotes.6.prefix"] = { link = "Purple" },
    ["@neorg.quotes.6.content"] = { link = "Purple" },
    ["@neorg.markup.strikethrough"] = { style = "strikethrough" },
    ["@neorg.lists.unordered.prefix"] = { fg = c.cyan },

    -- markdown and stuff
    ["@markup.heading.1"] = { fg = c.cyan, style = "bold" },
    ["@markup.heading.2"] = { fg = c.blue, style = "bold" },
    ["@markup.heading.3"] = { fg = c.yellow },
    ["@markup.heading.4"] = { fg = c.green },
    ["@markup.heading.5"] = { fg = c.blue },
    ["@markup.heading.6"] = { fg = c.yellow },
    ["@markup.raw"] = { fg = "#888e98" },
    ["@markup.raw.block"] = { bg = "#22252c" },
    ["@markup.italic"] = { link = "Italic" },
    ["@markup.strong"] = { link = "Bold" },
    ["@markup.strikethrough"] = { style = "strikethrough" },

    -- mini.trailspace
    MiniTrailspace = { bg = c.bg_visual },

    -- Indent Blankline
    IblIndent = { fg = c.fg_gutter, style = false },
    IblScope = { fg = c.dark5 }
  }

  theme.defer = {}

  if config.hideInactiveStatusline then
    local inactive = { style = 'underline', bg = c.bg, fg = c.bg, sp = c.bg_visual }

    -- StatusLine
    theme.base.StatusLineNC = inactive

    if vim.o.statusline ~= nil and string.find(vim.o.statusline, 'lualine') then
      -- Fix VertSplit & StatusLine crossover when lualine is active
      -- https://github.com/ful1e5/onedark.nvim/issues/2
      -- https://github.com/hoob3rt/lualine.nvim/issues/274
      theme.base.StatusLine = { bg = c.bg }

      -- LuaLine
      for _, section in pairs({ 'a', 'b', 'c' }) do
        theme.defer['lualine_' .. section .. '_inactive'] = inactive
      end
    end
  end

  if config.customTelescope then
    -- Telescope
    theme.plugins.TelescopeBorder = { fg = c.darker_black, bg = c.black }
    theme.plugins.TelescopePromptBorder = { fg = c.black2, bg = c.black2 }
    theme.plugins.TelescopePromptCounter = { fg = c.fg_dark, bg = c.black2 }
    theme.plugins.TelescopePromptNormal = { fg = c.fg, bg = c.black2 }
    theme.plugins.TelescopePromptPrefix = { fg = c.red, bg = c.black2 }
    theme.plugins.TelescopeNormal = { bg = c.black }
    theme.plugins.TelescopePreviewBorder = { fg = c.border, bg = c.black }
    theme.plugins.TelescopePreviewTitle = { fg = c.black, bg = c.green }
    theme.plugins.TelescopePromptTitle = { fg = c.black, bg = c.red }
    theme.plugins.TelescopeResultsBorder = { fg = c.black, bg = c.black }
    theme.plugins.TelescopeResultsTitle = { fg = c.black, bg = c.blue }
    theme.plugins.TelescopeSelection = { bg = c.darker_black }
  end

  return theme
end

return M
