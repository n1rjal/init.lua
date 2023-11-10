
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(buffer)
    local api = require "nvim-tree.api"
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer=buffer, noremap=true, silent=true, nowait=true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(buffer)
    -- Mappings
    vim.keymap.set('n', '<leader>b', "<cmd>:NvimTreeToggle<CR>", opts("Toggle"))
end

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach,
})
