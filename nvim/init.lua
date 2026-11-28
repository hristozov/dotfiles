-- Minimal Neovim config

vim.g.mapleader = " "

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.list = true
opt.listchars = { tab = ">-", trail = "·", nbsp = "␣" }
opt.scrolloff = 5

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.textwidth = 80
opt.undofile = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.spelllang = { "en", "bg" } -- used whenever spell is on

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>ev", "<cmd>edit $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>sv", "<cmd>source $MYVIMRC<CR>", { desc = "Reload config" })

-- Filetype tweaks
local augroup = vim.api.nvim_create_augroup("user", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "ruby", "lua", "javascript", "typescript", "json", "yaml" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
    vim.opt_local.textwidth = 72
  end,
})

-- File browser (built-in netrw)
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25 -- sidebar width (%) for :Lex / :Vex

-- Plugins (built-in vim.pack; versions pinned in nvim-pack-lock.json)
vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")
fzf.setup({})
fzf.register_ui_select() -- use fzf for code actions and other pickers

vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Search in files" })
vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>r", fzf.resume, { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols, { desc = "Symbols in file" })
vim.keymap.set("n", "<leader>S", fzf.lsp_live_workspace_symbols, { desc = "Symbols in workspace" })
vim.keymap.set("n", "<leader>d", fzf.diagnostics_workspace, { desc = "Diagnostics" })

-- LSP (built-in client; servers must be on PATH)
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
    },
  },
})
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("grr", fzf.lsp_references, "References")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
    vim.diagnostic.config({ virtual_text = true })
  end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function() vim.hl.on_yank() end,
})
