local keymap = vim.api.nvim_set_keymap
local options = { silent = true }

local search_dir = "/workspace"
function get_current_workspace()
  local full_path = vim.api.nvim_buf_get_name(0)
  local sub_path = string.match(full_path, search_dir .. "/(%w+)/")
  if not sub_path then
    return full_path
  end
  return search_dir .. '/' .. sub_path
end

--for plugin nvim-tree
keymap('n', '<C-b>', ':NvimTreeToggle<CR>', options)

--for plugin markdown-preview
keymap('n', '<C-m>', '<Plug>MarkdownPreviewToggle', options)

--for plugin SymbolsOutline
--keymap('n', '<Leader>t', ':SymbolsOutline<CR>', options)

--for plugin nvim-telescope
keymap('n', '<Leader>f', ':lua require("telescope.builtin").find_files({ search_dirs = { get_current_workspace() } })<CR>', options)
keymap('n', '<Leader>s', ':lua require("telescope.builtin").live_grep({ search_dirs = { get_current_workspace() } })<CR>', options)

--for plugin lsp
keymap('n', '<Leader>r', ':LspRestart<CR>', options)

--for plugin nvim-trouble
--keymap('n', '<Leader>e', ':TroubleToggle<CR>', options)

--for plugin translator
keymap('n', '<C-y>', ':TranslateW<CR>', options)

--for plugin barbar
keymap('n', '<C-h>', '<Cmd>BufferPrevious<CR>', options)
keymap('n', '<C-l>', '<Cmd>BufferNext<CR>', options)
keymap('n', '<C-x>', '<Cmd>BufferClose<CR>', options)
