require('lspsaga').setup({
  ui = {
    -- currently only round theme
    theme = 'round',
    -- border type can be single,double,rounded,solid,shadow.
    border = 'single',
    winblend = 0,
    expand = '',
    collapse = '',
    preview = ' ',
    code_action = '',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    colors = {
      --float window normal bakcground color
      normal_bg = 'None',
      --title background color
      title_bg = '#afd700',
      red = '#e95678',
      magenta = '#b33076',
      orange = '#FF8700',
      yellow = '#f7bb3b',
      green = '#afd700',
      cyan = '#36d0e0',
      blue = '#61afef',
      purple = '#CBA6F7',
      white = '#d1d4cf',
      black = '#1c1c19',
    },
    kind = {},
  },
  -- same as nvim-lightbulb but async
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 3000,
  finder_action_keys = {
    open = {'o', '<CR>'},
    vsplit = 's',
    split = 'i',
    tabe = 't',
    quit = {'q', '<ESC>'},
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },
  rename_action_quit = '<C-c>',
  rename_in_select = true,
  -- show symbols in winbar must nightly
  -- in_custom mean use lspsaga api to get symbols
  -- and set it to your custom winbar or some winbar plugins.
  -- if in_cusomt = true you must set in_enable to false
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' > ',
    show_file = true,
    -- define how to customize filename, eg: %:., %
    -- if not set, use default value `%:t`
    -- more information see `vim.fn.expand` or `expand`
    -- ## only valid after set `show_file = true`
    file_formatter = "%:p., %",
    click_support = false,
  },
  -- show outline
  outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
})

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
keymap("n", "gs", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Peek Definition
-- you can edit the definition file in this flaotwindow
---also support open/vsplit/etc operation check definition_action_keys
---support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

--Rename
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })

--Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

--Only jump to error
keymap('n', '<Leader>e', function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, options)

---- Outline
keymap("n", "<Leader>t", "<cmd>Lspsaga outline<CR>",{ silent = true })
