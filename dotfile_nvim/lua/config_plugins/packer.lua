local packer = require("packer")

packer.startup({
	function(use)
		--------------------- Packer --------------------
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		--------------------- LSP --------------------
		-- use("williamboman/nvim-lsp-installer")
		-- manson
		use({ "williamboman/mason.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		----------------------------------------------
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- formatter
		use({ "mhartington/formatter.nvim" })
		--------------------- Other --------------------
		use({ "lewis6991/hover.nvim" })
		-- nvim-treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "folke/trouble.nvim", ependencies = { "nvim-tree/nvim-web-devicons" } })
		-- nvim rainbow delimiter
		use({ "hiphish/rainbow-delimiters.nvim" })
		-- hop
		use({ "phaazon/hop.nvim", branch = "v2" })
		-- status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use("arkav/lualine-lsp-progress")
		-- 主题
		use("overcache/neosolarized")
		use("folke/tokyonight.nvim")
		-- accelerated-jk
		use({ "rainbowhxch/accelerated-jk.nvim" })
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- surround
		use("ur4ltz/surround.nvim")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		--git = {
		--  default_url_format = "https://hub.fastgit.xyz/%s",
		--  default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
		--  default_url_format = "https://gitcode.net/mirrors/%s",
		--  default_url_format = "https://gitclone.com/github.com/%s",
		--},
		-- 浮动显示
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-------------------------------------------------------
-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins_install.lua source <afile> | PackerSync
    augroup end
  ]]
)
