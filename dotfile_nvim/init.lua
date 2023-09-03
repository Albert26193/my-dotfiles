if vim.g.vscode then
	require("vscode_nvim.vs-basic")
	require("vscode_nvim.vs-keybinding")
	require("vscode_nvim.vs-hop")
	require("vscode_nvim.vs-comment")
else
	-- 基本配置
	require("config_general.basic")

	-- 插件配置
	-- 安装配置
	require("config_plugins.packer")
	-- cmp
	require("config_plugins.cmp")
	-- manson
	require("config_plugins.mason")
	-- telescope
	require("config_plugins.telescope")
	-- auto pair
	require("config_plugins.auto_pair")
	-- surround
	--require('config_plugins.surround')
	-- comment
	require("config_plugins.comment")
	-- nvim-treesitter
	require("config_plugins.nvim_treesitter")
	-- hop
	require("config_plugins.hop")
	-- lualine
	require("config_plugins.lualine")
	-- formatter
	require("config_plugins.formatter")
	--hover
	require("config_plugins.hover")
	require("config_plugins.trouble")
	-- indent_blankline
	require("config_plugins.indent_blankline")
	-- 主题设置
	require("config_general.colorscheme")
	-- 快捷键
	require("config_general.keybindings")
	-- lsp default config
	require("config_lsp.lsp_config")
end

if vim.o.termguicolors then
	vim.o.termguicolors = true
end

-- require('custom_command.highlight_mark')
