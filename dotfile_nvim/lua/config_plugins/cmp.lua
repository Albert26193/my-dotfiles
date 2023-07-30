local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("没有找到 nvim-cmp")
  return
end

cmp.setup({
  preselect = cmp.PreselectMode.Item,
  completion = {
        completeopt = "menu,menuone,noinsert",
  },
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources(
    { { name = "nvim_lsp" }, },
    { { name = "buffer" }, { name = "path" } }),


  -- 快捷键设置
  mapping = {
    -- 出现补全
    ["<leader>i"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消

    -- 上一个
    ["<Up>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<Down>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<Tab>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  }

})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
      { name = "cmdline" },
    }),
})
