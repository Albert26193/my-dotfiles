local status, mason = pcall(require, "mason")

if not status then
	vim.notify("not found mason")
	return
end

-- store LSP in ~/.local/share/nvim/mason/packages/
mason.setup()
