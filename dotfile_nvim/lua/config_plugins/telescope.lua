local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "vertical",
    -- 窗口内快捷键
    -- mappings = { },
    -- 忽略文件
    file_ignore_patterns = {"node_modules", ".git"},
  },
  pickers = {
    find_files = {
      ["fd"] = "find_files",
    },
  },
})

-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.cmd("command! -nargs=* -complete=dir -bar -bang Vfd vsplit <bar> Telescope find_files <args>")
vim.cmd("command! -nargs=* -complete=dir Fd Telescope find_files <args>")
vim.cmd("command! -nargs=* -complete=dir Gp Telescope live_grep <args>")
