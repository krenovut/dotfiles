vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings

local scrolloff = math.floor(vim.o.lines / 2) - 3
vim.o.scrolloff = scrolloff

vim.o.nu = true
vim.o.relativenumber = true
vim.o.wrap = false
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
vim.o.cursorline = true -- Highlight current line
--
-- Tabbing / Indentation
vim.o.tabstop = 4 -- Tab width
vim.o.shiftwidth = 4 -- Indent width
vim.o.softtabstop = 4 -- Soft tab stop
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Smart auto-indenting

-- Search Settings
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if uppercase in search
vim.o.hlsearch = true -- Don't highlight search results
vim.o.incsearch = true -- Show matches as you type

-- Behavior settings

vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.iskeyword:append("-") -- Treat dash as part of a word
vim.o.backspace = "indent,eol,start" -- Make backspace behave naturally
-- vim.opt.path:append("**") -- Search into subfolders with `gf`
vim.o.selection = "inclusive" -- Use inclusive selection
vim.o.mouse = "a" -- Enable mouse support
vim.o.modifiable = true -- Allow editing buffers
vim.o.encoding = "UTF-8" -- Use UTF-8 encoding
vim.o.wildignorecase = true -- Case-insensitive tab completion in commands
vim.o.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"

-- Undo
vim.o.undofile = true
-- Set undo directory and ensure it exists
local undodir = "~/.local/share/nvim/undodir" -- Undo directory path
local undodir_path = vim.fn.expand(undodir)
vim.opt.undodir = undodir_path -- Expand to full path
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- Create if not exists
end

-- Appearance settings
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#89b4fa" })
vim.o.winborder = "rounded"

vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.showmatch = true -- Highlight matching brackets
vim.o.cmdheight = 0
vim.o.wildoptions = "pum"
-- vim.o.wildmode = "full,noselect"

-- Cursor Settings
vim.opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, Command-line
	"i-ci-ve:block", -- Insert, Command-line Insert, Visual-exclusive
	"r-cr:hor20", -- Replace, Command-line Replace
	"o:hor50", -- Operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}

-- Folding Settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Keep all folds open by default

-- Split Behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- File Handling
vim.o.backup = false -- Don't create backup files
vim.o.writebackup = false -- Don't backup before overwriting
vim.o.swapfile = false -- Don't create swap files
vim.o.updatetime = 300 -- Time in ms to trigger CursorHold
vim.o.timeoutlen = 500 -- Time in ms to wait for mapped sequence
vim.o.ttimeoutlen = 0 -- No wait for key code sequences
vim.o.autoread = true -- Auto-reload file if changed outside
