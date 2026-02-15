local sev = vim.diagnostic.severity
local symbols = { [sev.ERROR] = "", [sev.WARN] = "", [sev.INFO] = "", [sev.HINT] = "󰌶" }

vim.diagnostic.config({
	signs = {
		text = symbols,
	},
})
