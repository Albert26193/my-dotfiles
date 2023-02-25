if vim.g.vscode then
  require('vscode_nvim.vs-basic')
  require('vscode_nvim.vs-jk')
  require('vscode_nvim.vs-leap')
  require('vscode_nvim.vs-keybinding')
else
  -- 基本配置
  require('config_general.basic')

  -- 插件配置
    -- 安装配置
  require('config_plugins.plugins_install')
    -- cmp
  require('config_plugins.cmp')
    -- telescope
  require('config_plugins.telescope')
    -- auto pair
    -- surround
    -- nvim-treesitter
  require('config_plugins.nvim_treesitter')
  -- 主题设置
  require('config_general.colorscheme')

  -- 快捷键
  require('config_general.keybindings')

  -- lsp default config
  require('config_lsp.lsp_config')
end
