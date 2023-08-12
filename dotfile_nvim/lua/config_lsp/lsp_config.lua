require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").jdtls.setup({})
require("lspconfig").awk_ls.setup({})
require("lspconfig").jsonls.setup({})

-- 针对不同语言设置不同的缩进宽度
vim.api.nvim_exec(
	[[
  autocmd FileType python setlocal tabstop=4 shiftwidth=4
  autocmd FileType sh setlocal tabstop=4 shiftwidth=4
  autocmd FileType c setlocal tabstop=4 shiftwidth=4
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4
  autocmd FileType go setlocal tabstop=4 shiftwidth=4
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
  autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
  autocmd FileType awk setlocal tabstop=4 shiftwidth=4
]],
	false
)
