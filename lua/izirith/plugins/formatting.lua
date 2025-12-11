return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier_custom" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				cpp = { "my_formatter" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				my_formatter = {
					command = "clang-format",
					args = { "--sort-includes=false", "--style={BasedOnStyle: Google, ColumnLimit: 0}" },
				},
				prettier_custom = {
					command = "prettier",
					inherit = true,
					args = function(_, ctx)
						return {
							"--stdin-filepath",
							ctx.filename,
							"--prose-wrap=always",
							"--print-width=120",
							"--parser=markdown",
						}
					end,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
