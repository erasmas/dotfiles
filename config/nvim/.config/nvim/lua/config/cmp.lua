local M = {}

function M.setup()

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local lspkind = require('lspkind')
  local snippy = require("snippy")
  local cmp = require 'cmp'
  
  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 50,
      })
    },
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
      end,
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
  
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippy.can_jump(-1) then
          snippy.previous()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'snippy' }
    },
    {
      { name = 'buffer' }
    })
  })
end

return M
