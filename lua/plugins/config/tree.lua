-- disable netrw at the very start of your init.lua (strongly advised)

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
	{ key = "zh", action = "toggle_dotfiles" },
	{ key = "<C-u>", action = "dir_up" },
	{ key = "<C-o>", action = "cd" }
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    --highlight_opened_files = "all",
    indent_markers = {
      enable = true
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    custom = { "node_modules", "vendor" },
    exclude = { ".env", "test*" }
  },
})
