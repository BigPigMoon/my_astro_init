-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "onedark",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " ▄▄▄▄    ██▓  ▄████  ██▓███   ██▓  ▄████  ███▄ ▄███▓ ▒█████   ▒█████   ███▄    █ ",
    "▓█████▄ ▓██▒ ██▒ ▀█▒▓██░  ██▒▓██▒ ██▒ ▀█▒▓██▒▀█▀ ██▒▒██▒  ██▒▒██▒  ██▒ ██ ▀█   █ ",
    "▒██▒ ▄██▒██▒▒██░▄▄▄░▓██░ ██▓▒▒██▒▒██░▄▄▄░▓██    ▓██░▒██░  ██▒▒██░  ██▒▓██  ▀█ ██▒",
    "▒██░█▀  ░██░░▓█  ██▓▒██▄█▓▒ ▒░██░░▓█  ██▓▒██    ▒██ ▒██   ██░▒██   ██░▓██▒  ▐▌██▒",
    "░▓█  ▀█▓░██░░▒▓███▀▒▒██▒ ░  ░░██░░▒▓███▀▒▒██▒   ░██▒░ ████▓▒░░ ████▓▒░▒██░   ▓██░",
    "░▒▓███▀▒░▓   ░▒   ▒ ▒▓▒░ ░  ░░▓   ░▒   ▒ ░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ ",
    "▒░▒   ░  ▒ ░  ░   ░ ░▒ ░      ▒ ░  ░   ░ ░  ░      ░  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░░   ░ ▒░",
    " ░    ░  ▒ ░░ ░   ░ ░░        ▒ ░░ ░   ░ ░          ░ ░ ░ ▒    ░ ░ ▒     ░   ░ ░ ",
    " ░       ░        ░           ░        ░                ░ ░      ░ ░           ░ ",
    "                                                                                 ",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
        disabled = {
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
    -- easily add or disable built in mappings added during LSP attaching
    -- mappings = {
    -- n = {
    -- ["<leader>lf"] = false -- disable formatting keymap
    -- },
    -- },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
      ["<leader>sl"] = { ":noh<cr>", desc = "Clear search results" },
      ["<leader>ft"] = { ":TodoTelescope<cr>", desc = "Todo comment search" }
    },
    -- t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- gruvbox
      -- { "ellisonleao/gruvbox.nvim" },
      -- todos
      -- {
      --   "folke/todo-comments.nvim",
      --   requires = "nvim-lua/plenary.nvim",
      --   config = function()
      --     require("todo-comments").setup {
      --       signs = true, -- show icons in the signs column
      --       sign_priority = 8, -- sign priority
      --       -- keywords recognized as todo comments
      --       keywords = {
      --         FIX = {
      --           icon = " ", -- icon used for the sign, and in search results
      --           color = "error", -- can be a hex color, or a named color (see below)
      --           alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      --           -- signs = false, -- configure signs for some keywords individually
      --         },
      --         TODO = { icon = " ", color = "info" },
      --         HACK = { icon = " ", color = "warning" },
      --         WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      --         PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      --         NOTE = { icon = " ", color = "hint", alt = { "INFO", "DEBUG" } },
      --         TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      --       },
      --       gui_style = {
      --         fg = "NONE", -- The gui style to use for the fg highlight group.
      --         bg = "BOLD", -- The gui style to use for the bg highlight group.
      --       },
      --       merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      --       -- highlighting of the line containing the todo comment
      --       -- * before: highlights before the keyword (typically comment characters)
      --       -- * keyword: highlights of the keyword
      --       -- * after: highlights after the keyword (todo text)
      --       highlight = {
      --         multiline = true, -- enable multine todo comments
      --         multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      --         multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      --         before = "", -- "fg" or "bg" or empty
      --         keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      --         after = "fg", -- "fg" or "bg" or empty
      --         pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
      --         comments_only = true, -- uses treesitter to match keywords in comments only
      --         max_line_len = 400, -- ignore lines longer than this
      --         exclude = {}, -- list of file types to exclude highlighting
      --       },
      --       -- list of named colors where we try to extract the guifg from the
      --       -- list of highlight groups or use the hex color if hl not found as a fallback
      --       colors = {
      --         error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      --         warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
      --         info = { "DiagnosticInfo", "#2563EB" },
      --         hint = { "DiagnosticHint", "#10B981" },
      --         default = { "Identifier", "#7C3AED" },
      --         test = { "Identifier", "#FF00FF" }
      --       },
      --       search = {
      --         command = "rg",
      --         args = {
      --           "--color=never",
      --           "--no-heading",
      --           "--with-filename",
      --           "--line-number",
      --           "--column",
      --         },
      --         -- regex that will be used to match keywords.
      --         -- don't replace the (KEYWORDS) placeholder
      --         pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      --         -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      --       },
      --
      --     }
      --   end,
      -- },
      -- theme
      -- ["navarasu/onedark.nvim"] = {
      --   config = function()
      --     -- Lua
      --     require('onedark').setup({
      --       -- Main options --
      --       style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      --       transparent = false, -- Show/hide background
      --       term_colors = true, -- Change terminal color as per the selected theme style
      --       ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
      --
      --       -- toggle theme style ---
      --       toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      --       toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' }, -- List of styles to toggle between
      --
      --       -- Change code style ---
      --       -- Options are italic, bold, underline, none
      --       -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
      --       code_style = {
      --         comments = 'italic',
      --         keywords = 'none',
      --         functions = 'none',
      --         strings = 'italic',
      --         variables = 'none'
      --       },
      --
      --       -- Lualine options --
      --       lualine = {
      --         transparent = false, -- lualine center bar transparency
      --       },
      --
      --       -- Custom Highlights --
      --       colors = {}, -- Override default colors
      --       highlights = {}, -- Override highlight groups
      --
      --       -- Plugins Config --
      --       diagnostics = {
      --         darker = true, -- darker colors for diagnostic
      --         undercurl = true, -- use undercurl instead of underline for diagnostics
      --         background = true, -- use background color for virtual text
      --       },
      --     })
      --   end,
      -- },
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    -- ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    --   -- config variable is the default configuration table for the setup function call
    --   -- local null_ls = require "null-ls"
    --
    --   -- Check supported formatters and linters
    --   -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    --   -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    --   config.sources = {
    --     -- Set a formatter
    --     -- null_ls.builtins.formatting.stylua,
    --     -- null_ls.builtins.formatting.prettier,
    --   }
    --   return config -- return final config table
    -- end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  -- ["which-key"] = {
  --   -- Add bindings which show up as group name
  --   register = {
  --     -- first key is the mode, n == normal mode
  --     n = {
  --       -- second key is the prefix, <leader> prefixes
  --       ["<leader>"] = {
  --         -- third key is the key to bring up next level and its displayed
  --         -- group name in which-key top level menu
  --         ["b"] = { name = "Buffer" },
  --       },
  --     },
  --   },
  -- },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  -- polish = function()
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
  -- end,
}

return config
