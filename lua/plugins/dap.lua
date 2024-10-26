return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = { "<leader>gu", "<leader>gb" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup({
			controls = {
				enabled = false,
				element = "console",
			},

			layouts = {
				{
					elements = {
						{ id = "watches", size = 0.20 },
						{ id = "breakpoints", size = 0.30 },
						{ id = "scopes", size = 0.50 },
					},
					position = "left",
					size = 40,
				},
				{ elements = { { id = "console", size = 1 } }, position = "bottom", size = 10 },
			},
		})

		require("nvim-dap-virtual-text").setup({
			--all_frames = true,
			--virt_text_pos = 'eol',
			only_first_definition = false,
			--all_refrences = true,
		})

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = os.getenv("CDAP"),
		}

		dap.configurations.c = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = function()
					local args_string = vim.fn.input("Arguments: ")
					return vim.split(args_string, " ")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}

		vim.keymap.set({ "n", "v" }, "<leader>gb", dap.toggle_breakpoint)
		vim.keymap.set({ "n", "v" }, "<leader>gu", dapui.toggle)
		vim.keymap.set({ "n", "v" }, "<leader>ge", function()
			dapui.eval(nil, { enter = true })
		end)
		vim.keymap.set({ "n", "v" }, "<leader>go", function()
			dapui.float_element("stacks", { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_over)
		vim.keymap.set("n", "<F3>", dap.step_back)
		vim.keymap.set("n", "<F8>", dap.step_out)
		vim.keymap.set("n", "<F9>", dap.step_into)
		vim.keymap.set("n", "<F10>", dap.restart)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end
	end,
}
