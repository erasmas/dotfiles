local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    [" "] = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" },

    f = {
      name = "file",
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      f = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", "Find string in files" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
      n = { "New File" }, -- just a label. don't create any mapping
      e = "Edit File", -- same as above
      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    },

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
      name = "Git",
      s = { "<cmd>Neogit<CR>", "Status" },
    },

    t = {
      name = "Tree",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle" }
    },

    x = {
      name = "Trouble",
      x = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace_diagnostics" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document_diagnostics" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" },
    }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
