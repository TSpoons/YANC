vim.g.mapleader = ';'
vim.wo.relativenumber = true
vim.wo.number = true

vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true


vim.o.shiftwidth = 4

vim.cmd("colorscheme kanagawa")

require('plugins')
require('leap').set_default_keymaps()
require('lualine').setup {
    options = { theme  = 'everforest' },        
}
require('mason').setup()
require('telescope').setup()
require('nvim-autopairs').setup()
require('nvim_comment').setup()
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
}

local opts = {
    tools = {
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
require('rust-tools').setup(opts)

local lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
lsp.clangd.setup {
  capabilities = capabilities,
}
lsp.tsserver.setup{}
lsp.pylsp.setup{on_attach=custom_attach}
lsp.volar.setup{
    init_options = {
        typescript = {
            tsdk = '/usr/local/lib/node_modules/typescript/lib'
        }
    }
}
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
        select = true,
        })
    },
    -- Installed sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})


require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml", "python" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    hijack_cursor = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

require('tmux').setup()

-- Match tab shift to tree width
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')
local function get_tree_size()
    return require'nvim-tree.view'.View.width
end
nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
end)
local function shift_tabs_left()
    bufferline_api.set_offset(0)
end
vim.api.nvim_create_autocmd({ "tabnew" }, { callback = shift_tabs_left })

local wk = require("which-key")
wk.register({
    g = {
        d = { "vim.lsp.buf.definition", "Go to definition" },
        i = { "vim.lsp.buf.implementation", "Go to implementation" },
        c = { "Comment line, can be followed by count and motion" },
    },
    f = {
        f = { "<cmd>Telescope find_files<CR>", "Find File" },
        g = { "<cmd>Telescope live_grep<CR>", "Find live grep" },
    },
}, { noremap = true })

wk.register({
    t = { "<cmd>NvimTreeFindFileToggle<CR>", "Open File Tree" },
    q = { "<cmd>BufferClose<CR>", "Close tab" },
    x = { "\"_d", "Delete to black hole"},
    d = { "\"+d", "Delete to clipboard"},
    y = { "\"+d", "Yank to clipboard"},
    ['1'] = { "<cmd>BufferGoto 1<CR>", "Switch to tab 1" },
    ['2'] = { "<cmd>BufferGoto 2<CR>", "Switch to tab 2" },
    ['3'] = { "<cmd>BufferGoto 3<CR>", "Switch to tab 3" },
    ['4'] = { "<cmd>BufferGoto 4<CR>", "Switch to tab 4" },
    ['5'] = { "<cmd>BufferGoto 5<CR>", "Switch to tab 5" },
    ['6'] = { "<cmd>BufferGoto 6<CR>", "Switch to tab 6" },
    ['7'] = { "<cmd>BufferGoto 7<CR>", "Switch to tab 7" },
    ['8'] = { "<cmd>BufferGoto 8<CR>", "Switch to tab 8" },
    ['9'] = { "<cmd>BufferGoto 9<CR>", "Switch to tab 9" },
}, { prefix = "<leader>" })

