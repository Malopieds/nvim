return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add debuggers here
    'leoluz/nvim-dap-go',
    -- javascript
    'mxsdev/nvim-dap-vscode-js',
    {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
    },
    -- java
    -- {
        -- 'mfussenegger/nvim-jdtls',
        -- ft = { "java" },
   -- --      config = function ()
			-- -- local config = {
   -- --              cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls'},
   -- --              root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
   -- --              init_options = {
   -- --                  bundles = { vim.fn.stdpath('data') .. vim.fn.glob('/lazy/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1') };
   -- --              }
			-- -- }
   -- --          require('jdtls').setup_dap { hotcodereplace = "auto" }
   -- --          require('jdtls.dap').setup_dap_main_class_configs()
			-- -- require("jdtls").start_or_attach(config)
   -- --      end
    -- },
    {
        "microsoft/java-debug",
        build = "./mvnw clean install",
    }
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,

      handlers = {},

      ensure_installed = {
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F10>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
      },
    }

    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
      -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    })
    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    for _, language in ipairs(js_based_languages) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require 'dap.utils'.pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Start Chrome with \"localhost\"",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
        }
      }
    end
    -- local config = {
    --     cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls'},
    --     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
        -- init_options = {
        --     bundles = { vim.fn.stdpath('data') .. vim.fn.glob('/lazy/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1') };
        -- }
    -- }
    -- require('jdtls').start_or_attach(config)

    dap.adapters.java = function(callback)
        callback({
            type = 'server';
            host = '127.0.0.1';
            port = 5005;
        })
    end
    -- require('jdtls.dap').setup_dap_main_class_configs()
    -- require("dap").configurations.java = {
    --
    -- }
  end,
}
