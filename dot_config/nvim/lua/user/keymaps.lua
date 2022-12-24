local opts = { noremap = true, silent = true }
--local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',


-- NORMAL --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<leader>sp', 'setlocal spell!<CR>', opts)
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>s', ':source $MYVIMRC<CR>', opts)

-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts) 

-- Telesscope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>f", builtin.find_files, opts)
--keymap('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>o', builtin.buffers, opts)
vim.keymap.set('n', '<leader>h', builtin.help_tags, opts)

-- Navigate buffers
keymap('n', ']b', ':bnext<CR>', opts)
keymap('n', '[b', ':bprevious<CR>', opts)


-- VISUAL --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)


-- VISUAL BLOCK --
-- Move text up and down
keymap('x', 'J', ':move >+1<CR>gv-gv', opts)
keymap('x', 'K', ':move <-2<CR>gv-gv', opts)


-- Referenced in LSP configura handlers.lua
function lsp_keymaps(bufnr)
  local bufOpts = { noremap = true, silent = true, buffer=bufnr}
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufOpts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufOpts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufOpts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufOpts)
  vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufOpts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufOpts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufOpts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufOpts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", bufOpts)
  vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', bufOpts)
  vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', bufOpts)
  vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', bufOpts)
  vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
