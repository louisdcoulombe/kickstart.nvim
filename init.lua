--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================


What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
--

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

local colorMap = {
  sumiInk1 = '#1F1F28',
  sumiInk3 = '#363646',
  sumiInk4 = '#54546D',
  waveBlue1 = '#223249',
  waveBlue2 = '#2D4F67',
  winterGreen = '#2B3328',
  winterYellow = '#49443C',
  winterRed = '#43242B',
  winterBlue = '#252535',
  autumnGreen = '#76946A',
  autumnRed = '#C34043',
  autumnYellow = '#DCA561',
  samuraiRed = '#E82424',
  roninYellow = '#FF9E3B',
  waveAqua1 = '#6A9589',
  dragonBlue = '#658594',
  fujiGray = '#727169',
  springViolet1 = '#938AA9',
  oniViolet = '#957FB8',
  crystalBlue = '#7E9CD8',
  springViolet2 = '#9CABCA',
  springBlue = '#7FB4CA',
  lightBlue = '#A3D4D5',
  waveAqua2 = '#7AA89F',
  springGreen = '#98BB6C',
  boatYellow1 = '#938056',
  boatYellow2 = '#C0A36E',
  carpYellow = '#E6C384',
  sakuraPink = '#D27E99',
  waveRed = '#E46876',
  peachRed = '#FF5D62',
  surimiOrange = '#FFA066',
  katanaGray = '#717C7C',
  backgroundMedium = '#2a2a37',
  -- Used for the terminal
  backgroundDark = '#15151c',
}

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
vim.keymap.set('n', ']]', ']]zz', { desc = 'Recenter when moving block' })
vim.keymap.set('n', '[[', '[[zz', { desc = 'Recenter when moving block' })

vim.keymap.set('n', '<A-Right>', ':vertical resize +5<CR>', { desc = 'Recenter when moving block' })
vim.keymap.set('n', '<A-Left>', ':vertical resize -5<CR>', { desc = 'Recenter when moving block' })
vim.keymap.set('n', '<A-Up>', ':resize +5<CR>', { desc = 'Recenter when moving block' })
vim.keymap.set('n', '<A-Down>', ':resize -5<CR>', { desc = 'Recenter when moving block' })

-- ["<leader>d"] = {"[[\"_d]]", desc="Delete without affecting buffer"},
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank remaining line' })
vim.keymap.set('n', '<leader>p', '[["_dP]]', { desc = 'Paste from clipboard' })
-- vim.keymap.set('n', '<leader>d', '[["_d]]', { desc = 'Delete without affecting buffer' })
vim.keymap.set('n', '<leader>y', '[["+y]]', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>Y', '[["+Y]]', { desc = 'Copy to clipboard (Y)' })
vim.keymap.set('n', '<leader><tab>', ':bn<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>`', ':bp<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>d', ':bd<cr>', { desc = 'Close active buffer' })
vim.keymap.set('n', '<leader>D', ':%bd|e#', { desc = 'Close all but active buffer' })
vim.keymap.set('v', '<leader>d', '[["_d]]', { desc = 'Delete without affecting buffer' })
vim.keymap.set('n', '<leader>xj', ":%!jq '.'", { desc = 'Format JSON' })

-- Run test file if it's a test_ otherwise run pytest in folder
-- vim.keymap.set('n', '<leader>xt', function()
--   local fn = vim.fn.expand '%:p'
--   if string.find(fn, 'test_') then
--     vim.api.nvim_command '!pytest %<cr>'
--   else
--     local str = '!pytest ' .. vim.fn.expand '%:h' .. '<cr>'
--     print(str)
--     vim.api.nvim_command(str)
--   end
-- end, { desc = 'Run test file' })

vim.keymap.set('n', '<leader>xt', ':!pytest %<cr>', { desc = 'Run test file' })
vim.keymap.set('n', '<leader>x1', ':!python3 % --p 0<cr>', { desc = 'Run Part 1' })
vim.keymap.set('n', '<leader>x2', ':!python3 % --p 1<cr>', { desc = 'Run Part 2' })
-- ["<leader>p"] = {"[[\"_dP]]", desc="Paste from clipboard"},
-- ["<leader>y"] = {"[[\"+y]]", desc="Copy to clipboard"},
--
-- ["<leaderapplication_idY"] = application_state
-- ["<leader>xm"] = {":MarkdownPreview<cr>", desc="MarkdownPreview"},
--
-- Set highlight on search, but clear on pressing <Esc> in normal mode
-- vim.opt.hlsearch = true
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>%(application_id)s

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- p:: Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      local cm = require 'Comment.api'

      vim.keymap.set('n', 'gc', function()
        cm.toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
      end, { desc = 'Toggle comment line' })

      vim.keymap.set('v', 'gc', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = 'Toggle comment for selection' })
    end,
  },
  -- p:: Bufferline
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {}
    end,
  },

  -- p:: Harpoond
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: Add' })

      vim.keymap.set('n', '<leader>A', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon toggle UI' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: 1' })

      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: 2' })

      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: 3' })

      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: 4' })

      vim.keymap.set('n', '<leader>5', function()
        harpoon:list():select(5)
      end, { desc = 'Harpoon: 5' })

      vim.keymap.set('n', '<leader>6', function()
        harpoon:list():select(6)
      end, { desc = 'Harpoon: 6' })
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.keymap.set('n', '<leader>xm', ':MardownPreview<cr>', { desc = 'MarkdownPreview' })
    end,
    ft = { 'markdown' },
  },
  -- Fugitive
  {
    'tpope/vim-fugitive',
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>gg', ':G<cr>', { desc = 'Fugitive' })
      vim.keymap.set('n', '<leader>gc', ':G commit<cr>', { desc = 'Fugitive' })
    end,
  },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }

      vim.keymap.set('n', ']g', function()
        require('gitsigns').next_hunk()
      end, { desc = 'Next Git hunk' })
      vim.keymap.set('n', '[g', function()
        require('gitsigns').prev_hunk()
      end, { desc = 'Previous Git hunk' })
      vim.keymap.set('n', '<leader>gl', function()
        require('gitsigns').blame_line()
      end, { desc = 'View Git blame' })
      vim.keymap.set('n', '<leader>gL', function()
        require('gitsigns').blame_line { full = true }
      end, { desc = 'View full Git blame' })
      vim.keymap.set('n', '<leader>gp', function()
        require('gitsigns').preview_hunk()
      end, { desc = 'Preview Git hunk' })
      vim.keymap.set('n', '<leader>gh', function()
        require('gitsigns').reset_hunk()
      end, { desc = 'Reset Git hunk' })
      vim.keymap.set('n', '<leader>gr', function()
        require('gitsigns').reset_buffer()
      end, { desc = 'Reset Git buffer' })
      vim.keymap.set('n', '<leader>gs', function()
        require('gitsigns').stage_hunk()
      end, { desc = 'Stage Git hunk' })
      vim.keymap.set('n', '<leader>gS', function()
        require('gitsigns').stage_buffer()
      end, { desc = 'Stage Git buffer' })
      vim.keymap.set('n', '<leader>gu', function()
        require('gitsigns').undo_stage_hunk()
      end, { desc = 'Unstage Git hunk' })
      vim.keymap.set('n', '<leader>gd', function()
        require('gitsigns').diffthis()
      end, { desc = 'View Git diff' })
    end,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ebugger', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]efactor', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>x'] = { name = '[X]custom', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]ests', _ = 'which_key_ignore' },
      }
    end,
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local actions = require 'telescope.actions'
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = {
              -- ['<C-n>'] = actions.cycle_history_next,
              -- ['<C-p>'] = actions.cycle_history_prev,
              -- ['<C-j>'] = actions.move_selection_next,
              -- ['<C-k>'] = actions.move_selection_previous,
              ['<C-c>'] = actions.git_create_branch,
            },
            n = { q = actions.close },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Telescope::find
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = '[F]ind Marks' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fF', function()
        require('telescope.builtin').find_files { hidden = true, no_ignore = true }
      end, { desc = 'Find all files' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fG', function()
        require('telescope.builtin').live_grep {
          additional_args = function(args)
            return vim.list_extend(args, { '--hidden', '--no-ignore' })
          end,
        }
      end, { desc = '[F]ind words in all files' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      vim.keymap.set('n', "<leader>f'", builtin.marks, { desc = '[F]ind marks' })

      -- Telescope::Git
      vim.keymap.set('n', '<leader>gt', builtin.git_status, { desc = '[F]ind Git S[t]atus' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[F]ind git files' })
      vim.keymap.set('n', '<leader>gb', function()
        builtin.git_branches { use_file_path = true }
      end, { desc = 'Git branches' })
      vim.keymap.set('n', '<leader>gM', function()
        builtin.git_commits { use_file_path = true }
      end, { desc = 'Git commits' })
      vim.keymap.set('n', '<leader>gm', function()
        builtin.git_bcommits { use_file_path = true }
      end, { desc = 'Git commits' })
      vim.keymap.set('n', '<leader>gP', ':!git push<cr>', { desc = '[G]it [P]ush to remote' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader><leader>', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[space space] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[F]ind [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind [N]eovim files' })
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function() end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('mason').setup()
      require('mason-nvim-dap').setup {
        ensure_installed = { 'stylua', 'debugpy', 'delve' },
        handlers = {}, -- sets up dap in the predefined manner
      }
    end,
  },
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>lt', require('telescope.builtin').treesitter, 'Treesitter')
          map('<leader>le', require('telescope.builtin').diagnostics, '[G]oto [D]efinition')
          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('<leader>ld', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('<leader>lr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('<leader>li', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>ln', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>la', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>lk', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('<leader>lh', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          -- local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.server_capabilities.documentHighlightProvider then
          --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          --     buffer = event.buf,
          --     callback = vim.lsp.buf.document_highlight,
          --   })
          --
          --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          --     buffer = event.buf,
          --     callback = vim.lsp.buf.clear_references,
          --   })
          -- end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- TODO : Add python and gopls
        -- clangd = {},
        gopls = {
          {
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
              gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                  unusedparams = true,
                },
              },
            },
          },
        },

        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              -- disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                -- ignore = { '*' },
              },
            },
          },
        },

        -- ruff_lsp = {
        --   init_options = {
        --     settings = {
        --       -- Any extra CLI arguments for `ruff` go here.
        --       args = {},
        --     },
        --   },
        -- },
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        -- typescript-language-server = {},
        html = {},
        cssls = {},
        tailwindcss = {},
        emmet_ls = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
        'prettier', -- prettier formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
        'eslint_d', -- js linter
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  { 'folke/neodev.nvim', opts = {} },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      {
        'rcarriga/cmp-dap',
        dependencies = { 'nvim-cmp' },
      },
    },
    config = function()
      require('neodev').setup {
        library = { plugins = { 'nvim-dap-ui' }, types = true },
      }

      require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
        sources = {
          { name = 'dap' },
        },
      })

      require('dapui').setup()
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- maps.n["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" }
      vim.keymap.set('n', '<F5>', function()
        dap.continue()
      end, { desc = 'Debugger: Start' })

      -- maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5
      vim.keymap.set('n', '<F17>', function()
        dap.terminate()
      end, { desc = 'Debugger: Start' })

      -- maps.n["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" } -- Control+F5
      vim.keymap.set('n', '<F29>', function()
        dap.restart_frame()
      end, { desc = 'Debugger: Restart' })
      -- maps.n["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" }
      vim.keymap.set('n', '<F6>', function()
        dap.pause()
      end, { desc = 'Debugger: Pause' })
      -- maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
      vim.keymap.set('n', '<F9>', function()
        dap.toggle_breakpoint()
      end, { desc = 'Debugger: Toggle Breakpoint' })

      -- maps.n["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" }
      vim.keymap.set('n', '<F10>', function()
        dap.step_over()
      end, { desc = 'Debugger: Step Over (F10)' })

      -- maps.n["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" }
      vim.keymap.set('n', '<leader>di', function()
        dap.step_over()
      end, { desc = 'Debugger: Step Over (F11)' })

      -- maps.n["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" }
      vim.keymap.set('n', '<F11>', function()
        dap.step_into()
      end, { desc = 'Debugger: Step Into' })

      -- maps.n["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" } -- Shift+F11
      vim.keymap.set('n', '<F23>', function()
        dap.step_out()
      end, { desc = 'Debugger: Step Out' })

      -- maps.n["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
      vim.keymap.set('n', '<leader>dO', function()
        dap.step_out()
      end, { desc = 'Debugger: Step Over (S-F11)' })
      --
      -- maps.n["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" }
      vim.keymap.set('n', '<leader>do', function()
        dap.step_out()
      end, { desc = 'Debugger: Step Over (F10)' })

      -- maps.n["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" }
      vim.keymap.set('n', '<leader>db', function()
        dap.toggle_breakpoint()
      end, { desc = 'Debugger: Toggle Breakpoint' })
      -- maps.n["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" }
      vim.keymap.set('n', '<leader>dB', function()
        dap.clear_breakpoints()
      end, { desc = 'Debugger: Toggle Breakpoint' })

      -- maps.n["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" }
      vim.keymap.set('n', '<leader>dc', function()
        dap.continue()
      end, { desc = 'Debugger: Continue (F5)' })

      -- maps.n["<leader>dC"] = {
      vim.keymap.set('n', '<leader>dC', function()
        vim.ui.input({ prompt = 'Condition: ' }, function(condition)
          if condition then
            require('dap').set_breakpoint(condition)
          end
        end)
      end, { desc = 'Conditional Breakpoint (S-F9)' })

      -- maps.n["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" }
      vim.keymap.set('n', '<leader>dq', function()
        dap.close()
      end, { desc = 'Debugger: Close session' })

      -- maps.n["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" }
      vim.keymap.set('n', '<leader>dQ', function()
        dap.terminate()
      end, { desc = 'Debugger: Terminate (S-F5)' })

      -- maps.n["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" }
      vim.keymap.set('n', '<leader>dp', function()
        dap.pause()
      end, { desc = 'Debugger: Pause (F6)' })

      -- maps.n["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
      vim.keymap.set('n', '<leader>df', function()
        dap.restart_frame()
      end, { desc = 'Debugger: Restart (C-F5)' })

      -- maps.n["<leader>ds"] = { function() require("dap").run_to_cursor() end, desc = "Run To Cursor" }
      vim.keymap.set('n', '<leader>ds', function()
        dap.run_to_cursor()
      end, { desc = 'Debugger: Run to cursor' })

      vim.keymap.set('n', '<leader>dE', function()
        vim.ui.input({ prompt = 'Expression: ' }, function(expr)
          if expr then
            require('dapui').eval(expr, { enter = true })
          end
        end)
      end, { desc = 'Evaluate Input' })
      --
      --   maps.v["<leader>dE"] = { function() require("dapui").eval() end, desc = "Evaluate Input" }
      vim.keymap.set('n', '<leader>dE', function()
        dapui.eval()
      end, { desc = 'Debugger: Evaluate input' })

      --   maps.n["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" }
      vim.keymap.set('n', '<leader>du', function()
        dapui.toggle()
      end, { desc = 'Debugger: Toggle debugger UI' })

      --   maps.n["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" }
      vim.keymap.set('n', '<leader>dh', function()
        dapui.hover()
      end, { desc = 'Debugger: Debugger Hover' })
    end,
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'vim-dadbod-completion', priority = 700 }, -- for dbui
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      statusline.setup()

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'go', 'python', 'json', 'yaml' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()

      vim.keymap.set('v', '<leader>xf', ':GoFillStruct<cr>', { desc = 'go: GoFillStruct' })
      vim.keymap.set('v', '<leader>xe', ':GoIfErr<cr>', { desc = 'go: if err' })
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', '<leader>e', ':Oil<cr>', { desc = 'File [E]xplorer (Oil)' })

      require('oil').setup {
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          'icon',
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = 'hide',
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = 'no',
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'nvic',
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 1000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = false,
        },
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = 'editable',
        -- Set to true to watch the filesystem for changes and reload oil
        experimental_watch_for_changes = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-v>'] = 'actions.select_vsplit',
          ['<C-h>'] = 'actions.select_split',
          ['<C-t>'] = 'actions.select_tab',
          ['gp'] = 'actions.preview',
          ['<leader>e'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['H'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
        -- Configuration for the floating keymaps help window
        keymaps_help = {
          border = 'rounded',
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, '.')
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort file names in a more intuitive order for humans. Is less performant,
          -- so you may want to set to false if you work with large directories.
          natural_order = true,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { 'type', 'asc' },
            { 'name', 'asc' },
          },
        },
        -- EXPERIMENTAL support for performing file operations with git
        git = {
          -- Return true to automatically git add/mv/rm files
          add = function(path)
            return false
          end,
          mv = function(src_path, dest_path)
            return false
          end,
          rm = function(path)
            return false
          end,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = 'rounded',
          minimized_border = 'none',
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating SSH window
        ssh = {
          border = 'rounded',
        },
      }
    end,
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()

      vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
        require('refactoring').select_refactor()
      end, { desc = 'Refactoring' })
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup()
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
      vim.keymap.set('n', '<leader>rn', ':IncRename ', { desc = 'Rename' })
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-python',
    },
    config = function()
      local neotest = require 'neotest'
      local map_opts = { noremap = true, silent = true, nowait = true }

      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      require('neotest').setup {
        quickfix = {
          open = false,
          enabled = false,
        },
        status = {
          enabled = true,
          signs = true, -- Sign after function signature
          virtual_text = false,
        },
        icons = {
          child_indent = '│',
          child_prefix = '├',
          collapsed = '─',
          expanded = '╮',
          failed = '✘',
          final_child_indent = ' ',
          final_child_prefix = '╰',
          non_collapsible = '─',
          passed = '✓',
          running = '',
          running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
          skipped = '↓',
          unknown = '',
        },
        floating = {
          border = 'rounded',
          max_height = 0.9,
          max_width = 0.9,
          options = {},
        },
        summary = {
          open = 'botright vsplit | vertical resize 60',
          mappings = {
            attach = 'a',
            clear_marked = 'M',
            clear_target = 'T',
            debug = 'd',
            debug_marked = 'D',
            expand = { '<CR>', '<2-LeftMouse>' },
            expand_all = 'e',
            jumpto = 'i',
            mark = 'm',
            next_failed = 'J',
            output = 'o',
            prev_failed = 'K',
            run = 'r',
            run_marked = 'R',
            short = 'O',
            stop = 'u',
            target = 't',
            watch = 'w',
          },
        },
        highlights = {
          adapter_name = 'NeotestAdapterName',
          border = 'NeotestBorder',
          dir = 'NeotestDir',
          expand_marker = 'NeotestExpandMarker',
          failed = 'NeotestFailed',
          file = 'NeotestFile',
          focused = 'NeotestFocused',
          indent = 'NeotestIndent',
          marked = 'NeotestMarked',
          namespace = 'NeotestNamespace',
          passed = 'NeotestPassed',
          running = 'NeotestRunning',
          select_win = 'NeotestWinSelect',
          skipped = 'NeotestSkipped',
          target = 'NeotestTarget',
          test = 'NeotestTest',
          unknown = 'NeotestUnknown',
        },
        adapters = {
          require 'neotest-vitest',
          require 'neotest-go',
        },
      }

      vim.api.nvim_set_hl(0, 'NeotestBorder', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestIndent', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestExpandMarker', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestDir', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestFile', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestFailed', { fg = colorMap.samuraiRed })
      vim.api.nvim_set_hl(0, 'NeotestPassed', { fg = colorMap.springGreen })
      vim.api.nvim_set_hl(0, 'NeotestSkipped', { fg = colorMap.fujiGray })
      vim.api.nvim_set_hl(0, 'NeotestRunning', { fg = colorMap.carpYellow })
      vim.api.nvim_set_hl(0, 'NeotestNamespace', { fg = colorMap.crystalBlue })
      vim.api.nvim_set_hl(0, 'NeotestAdapterName', { fg = colorMap.oniViolet })

      map_opts['desc'] = 'Test file'
      vim.keymap.set('n', '<localleader>tfr', function()
        neotest.run.run(vim.fn.expand '%')
      end, map_opts)

      map_opts['desc'] = 'Test nearest'
      vim.keymap.set('n', '<localleader>tr', function()
        neotest.run.run()
        neotest.summary.open()
      end, map_opts)

      map_opts['desc'] = 'Test output'
      vim.keymap.set('n', '<localleader>to', function()
        neotest.output.open { last_run = true, enter = true }
      end)

      map_opts['desc'] = 'Test summary toggle'
      vim.keymap.set('n', '<localleader>tt', function()
        neotest.summary.toggle()
        -- u.resize_vertical_splits()
      end, map_opts)

      -- vim.keymap.set(
      --   "n",
      --   "<localleader>tn",
      --   neotest.jump.next,
      --   map_opts
      -- )
      --
      -- vim.keymap.set(
      --   "n",
      --   "<localleader>tp",
      --   neotest.jump.prev,
      --   map_opts
      -- )

      map_opts['desc'] = 'Test last'
      vim.keymap.set('n', '<localleader>tl', function()
        neotest.run.run_last { enter = true }
        neotest.output.open { last_run = true, enter = true }
      end, map_opts)
    end,
  },
  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}

vim.cmd [[
command! NeotestSummary lua require("neotest").summary.toggle()
command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
command! NeotestNearest lua require("neotest").run.run()
command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
command! NeotestAttach lua require("neotest").run.attach()
command! NeotestOutput lua require("neotest").output.open()
]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- IfErr
