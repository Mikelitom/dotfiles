-- ======================
-- Plugins con Packer
-- ======================
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Flutter/Dart
    use 'neovim/nvim-lspconfig'
    use {
        'akinsho/flutter-tools.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    use {
        'nexxeln/vesper.nvim',
        config = function()
            require('vesper').setup({})

            vim.cmd([[colorscheme vesper]])

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" }) -- Para que el explorador de archivos también sea transparente
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Autocompletado
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Mason
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate"
    }

    use {
        "williamboman/mason-lspconfig.nvim"
    }

    -- Debugging (opcional)
    use 'mfussenegger/nvim-dap'

    -- Busca esta parte en tu archivo y reemplázala por esto:
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('telescope').setup({
                defaults = {
                    layout_strategy = 'horizontal',
                    layout_config = {
                        prompt_position = "top", -- Buscador arriba tipo Rofi
                    },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { "node_modules", ".git", "venv", "target" },
                }
            })
        end
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      config = function()
        require('lualine').setup({
          options = {
            theme = 'auto', -- Cambia automáticamente con tu colorscheme
            component_separators = { left = '│', right = '│' },
            section_separators = { left = '', right = '' }, -- Bordes diagonales modernos
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          }
        })
      end
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    dart = { "dart_format" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    })

    use {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "╎", -- El carácter de la línea (puedes usar │, ╎, ┆)
                },
                scope = {
                    enabled = true,
                    show_start = false,
                    show_end = false,
                },
            })
        end
    }


    use({
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]], -- Ctrl + \ para abrir/cerrar
                hide_numbers = true,
                shade_terminals = true,
                direction = 'float',      -- Aquí es donde activas el modo flotante
                float_opts = {
                    border = 'curved',      -- Bordes redondeados
                    winblend = 3,
                },
            })
        end
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",

                view = {
                    width = 40,
                    side = "left",
                },

                renderer = {
                    icons = {
                        show = {
                            git = true,
                            folder = true,
                            file = true,
                            folder_arrow = true,
                        },
                    },
                },

                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },

                git = {
                    enable = true,
                    ignore = false,
                },
            })
        end
    }
end)
