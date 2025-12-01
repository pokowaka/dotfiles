-- lua/plugins/clangd.lua
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					-- We don't want mason to resolve clangd, we use mise to find the right path
					mason = false,
					-- This defines the command that starts the language server.
					-- We explicitly add the flags needed for Bazel.
					cmd = vim.fn.has("mac")
							and {
								"/Users/jansene/src/main-emu-next-dev/prebuilts/clang/host/darwin-x86/clang-r563880/bin/clangd",
								"--background-index",
								"--clang-tidy",
								"--header-insertion=iwyu",
								"--completion-style=detailed",
								"--function-arg-placeholders",
								"--fallback-style=llvm",
								"--query-driver=/usr/bin/clang++,**/*clang*",
							}
						or {
							-- cmd for Linux
							"/usr/local/google/home/jansene/src/main-emu-next-dev/prebuilts/clang/host/linux-x86/clang-r584948/bin/clangd", -- Example, replace with your actual Linux clangd path
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
							"--query-driver=/usr/bin/clang++,**/*clang*",
						},
				},
			},
		},
	},
}
