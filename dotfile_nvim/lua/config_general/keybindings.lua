vim.g.mapleader = "qq"
vim.g.maplocalleader = "qq"

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

-- Terminal相关
--map("n", "<leader>t", ":sp | terminal<CR>", opt)
--map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
--map("t", "<Esc>", "<C-\\><C-n>", opt)
--map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
--map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
--map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
--map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
-- map("n", "<leader>o", ":NvimTreeToggle<CR>", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
--pluginKeys.cmp = function(cmp)
--  local has_words_before = function()
--    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--  end
--
--  local feedkey = function(key, mode)
--    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
--  end
--  return {
--    -- tab like
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif vim.fn["vsnip#available"](1) == 1 then
--        feedkey("<Plug>(vsnip-expand-or-jump)", "")
--      elseif has_words_before() then
--        cmp.complete()
--      else
--        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--      end
--    end, { "i", "s" }),
--
--    ["<S-Tab>"] = cmp.mapping(function()
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--        feedkey("<Plug>(vsnip-jump-prev)", "")
--      end
--    end, { "i", "s" }),
--
--    -- 出现补全
--    ["<leader>a"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
--    -- 取消
--    
--    -- 上一个
--    ["<Up>"] = cmp.mapping.select_prev_item(),
--    -- 下一个
--    ["<Down>"] = cmp.mapping.select_next_item(),
--    -- 确认
--    ["<Tab>"] = cmp.mapping.confirm({
--      select = true,
--      behavior = cmp.ConfirmBehavior.Replace
--    }),
--
--    ["<CR>"] = cmp.mapping.confirm({
--      select = true,
--      behavior = cmp.ConfirmBehavior.Replace
--    }),
--    -- 如果窗口内容太多，可以滚动
--    --["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
--    --["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
--  }
--end

return pluginKeys

