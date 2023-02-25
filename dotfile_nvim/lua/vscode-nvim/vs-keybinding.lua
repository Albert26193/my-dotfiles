local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<Tab>', ':Tabnext<CR>', opts)
keymap('n', '<S-Tab>', ':Tabprev<CR>', opts)
keymap('', '<Space>', '<Nop>', opts)

-- Better window navigation
keymap('n', '<C-j>', ':call VSCodeNotify("workbench.action.navigateDown")<CR>', opts)
keymap('x', '<C-j>', ':call VSCodeNotify("workbench.action.navigateDown")<CR>', opts)
keymap('n', '<C-k>', ':call VSCodeNotify("workbench.action.navigateUp")<CR>', opts)
keymap('x', '<C-k>', ':call VSCodeNotify("workbench.action.navigateUp")<CR>', opts)
keymap('n', '<C-h>', ':call VSCodeNotify("workbench.action.navigateLeft")<CR>', opts)
keymap('x', '<C-h>', ':call VSCodeNotify("workbench.action.navigateLeft")<CR>', opts)
keymap('n', '<C-l>', ':call VSCodeNotify("workbench.action.navigateRight")<CR>', opts)
keymap('x', '<C-l>', ':call VSCodeNotify("workbench.action.navigateRight")<CR>', opts)

-- Use VSCode references
keymap('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>', opts)

-- Change editor width
keymap('n', '<C-w>_', ':<C-u>call VSCodeNotify("workbench.action.toggleEditorWidths")<CR>', opts)

-- Use Space to open Which Key
keymap('n', '<Space>', ':call VSCodeNotify("whichkey.show")<CR>', opts)

-- fold
keymap('n', 'zM', ':call VSCodeNotify("editor.foldAll")<CR>', opts)
keymap('n', 'zR', ':call VSCodeNotify("editor.unfoldAll")<CR>', opts)
keymap('n', 'zc', ':call VSCodeNotify("editor.fold")<CR>', opts)
keymap('n', 'zo', ':call VSCodeNotify("editor.unfold")<CR>', opts)

-- Use VSCode Comments
opts.noremap = false
keymap('x', 'gc', '<Plug>VSCodeCommentary', opts)
keymap('n', 'gc', '<Plug>VSCodeCommentary', opts)
keymap('o', 'gc', '<Plug>VSCodeCommentary', opts)
keymap('n', 'gcc', '<Plug>VSCodeCommentaryLine', opts)

-- 自定义翻半页
opts.noremap = true
keymap('n', '<C-u>', '20k', opts)
keymap('n', '<C-d>', '20j', opts)

-- jk 用映射jk，消除移动光标时展开折叠
--keymap('n', 'j', 'gj', opts)
--keymap('v', 'j', 'gj', opts)
--keymap('n', 'k', 'gk', opts)
--keymap('v', 'k', 'gk', opts)

