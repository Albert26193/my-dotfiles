local status, acceleratedJk = pcall(require, "accelerated-jk")

if not status then
  vim.notify("no found accelerated-jk")
  return
end

acceleratedJk.setup({
    mode = 'time_driven',
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = 800,
    acceleration_table = { 5, 8, 10, 12, 20, 24, 30, 32, 40, 50, 60, 80 },
    -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
    deceleration_table = { {150, 9999} }
})

vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

print("already config the vs-jk")
