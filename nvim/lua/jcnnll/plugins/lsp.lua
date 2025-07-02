return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { "mason-org/mason.nvim", opts = {} },
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Useful status updates for LSP.
        { "j-hui/fidget.nvim", opts = {} },

        -- Allows extra capabilities provided by blink.cmp
        "saghen/blink.cmp",
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Rename the variable under your cursor.
                map("rn", vim.lsp.buf.rename, "[R]e[n]ame")

                -- Execute a code action, usually your cursor needs to be on top of an error
                map("ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

                -- Find references for the word under your cursor.
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                -- Jump to the implementation of the word under your cursor.
                map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                -- Jump to the definition of the word under your cursor.
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                -- Goto Declaration.
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- Fuzzy find all the symbols in your current document.
                map("gs", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

                -- Fuzzy find all the symbols in your current workspace.
                map("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

                -- Jump to the type of the word under your cursor.
                map("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                ---@param client vim.lsp.Client
                ---@param method vim.lsp.protocol.Method
                ---@param bufnr? integer some lsp support methods only in specific files
                ---@return boolean
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has("nvim-0.11") == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end
            end,
        })

        -- Diagnostic Config
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            },
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Enable the following language servers
        local servers = {
            clangd = {},
            cssls = {},
            gopls = {},
            emmet_ls = {
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss" },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            },
            graphql = {
                filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
            },
            html = {
                filetypes = { "html", "templ", "php" },
            },
            intelephense = {
                settings = {
                    intelephense = {
                        stubs = {
                            "amqp",
                            "apache",
                            "apcu",
                            "bcmath",
                            "blackfire",
                            "bz2",
                            "calendar",
                            "cassandra",
                            "com_dotnet",
                            "Core",
                            "couchbase",
                            "crypto",
                            "ctype",
                            "cubrid",
                            "curl",
                            "date",
                            "dba",
                            "decimal",
                            "dom",
                            "ds",
                            "enchant",
                            "Ev",
                            "event",
                            "exif",
                            "fann",
                            "FFI",
                            "ffmpeg",
                            "fileinfo",
                            "filter",
                            "fpm",
                            "ftp",
                            "gd",
                            "gearman",
                            "geoip",
                            "geos",
                            "gettext",
                            "gmagick",
                            "gmp",
                            "gnupg",
                            "grpc",
                            "hash",
                            "http",
                            "ibm_db2",
                            "iconv",
                            "igbinary",
                            "imagick",
                            "imap",
                            "inotify",
                            "interbase",
                            "intl",
                            "json",
                            "judy",
                            "ldap",
                            "leveldb",
                            "libevent",
                            "libsodium",
                            "libxml",
                            "lua",
                            "lzf",
                            "mailparse",
                            "mapscript",
                            "mbstring",
                            "mcrypt",
                            "memcache",
                            "memcached",
                            "meminfo",
                            "meta",
                            "ming",
                            "mongo",
                            "mongodb",
                            "mosquitto-php",
                            "mqseries",
                            "msgpack",
                            "mssql",
                            "mysql",
                            "mysql_xdevapi",
                            "mysqli",
                            "ncurses",
                            "newrelic",
                            "oauth",
                            "oci8",
                            "odbc",
                            "openssl",
                            "parallel",
                            "Parle",
                            "pcntl",
                            "pcov",
                            "pcre",
                            "pdflib",
                            "PDO",
                            "pdo_ibm",
                            "pdo_mysql",
                            "pdo_pgsql",
                            "pdo_sqlite",
                            "pgsql",
                            "Phar",
                            "phpdbg",
                            "posix",
                            "pspell",
                            "pthreads",
                            "radius",
                            "rar",
                            "rdkafka",
                            "readline",
                            "recode",
                            "redis",
                            "Reflection",
                            "regex",
                            "rpminfo",
                            "rrd",
                            "SaxonC",
                            "session",
                            "shmop",
                            "SimpleXML",
                            "snmp",
                            "soap",
                            "sockets",
                            "sodium",
                            "solr",
                            "SPL",
                            "SplType",
                            "SQLite",
                            "sqlite3",
                            "sqlsrv",
                            "ssh2",
                            "standard",
                            "stats",
                            "stomp",
                            "suhosin",
                            "superglobals",
                            "svn",
                            "sybase",
                            "sync",
                            "sysvmsg",
                            "sysvsem",
                            "sysvshm",
                            "tidy",
                            "tokenizer",
                            "uopz",
                            "uv",
                            "v8js",
                            "wddx",
                            "win32service",
                            "winbinder",
                            "wincache",
                            "xcache",
                            "xdebug",
                            "xhprof",
                            "xml",
                            "xmlreader",
                            "xmlrpc",
                            "xmlwriter",
                            "xsl",
                            "xxtea",
                            "yaf",
                            "yaml",
                            "yar",
                            "zend",
                            "Zend OPcache",
                            "ZendCache",
                            "ZendDebugger",
                            "ZendUtils",
                            "zip",
                            "zlib",
                            "zmq",
                            "zookeeper",
                            "wordpress",
                            "woocommerce",
                            "acf-pro",
                            "wordpress-globals",
                            "wp-cli",
                            "genesis",
                            "polylang",
                        },
                        environment = {
                            includePaths = {
                                "/Users/jay/.composer/vendor/php-stubs/",
                            },
                        },
                        files = {
                            maxSize = 5000000,
                        },
                    },
                },
            },
            lua_ls = {
                -- cmd = { ... },
                -- filetypes = { ... },
                -- capabilities = {},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = { disable = { "missing-fields" } },
                    },
                },
            },
            pyright = {},
            ts_ls = {},
            yamlls = {},
        }

        -- Ensure the servers and tools above are installed
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            -- format
            "black",
            "isort",
            "phpactor",
            "phpcbf",
            "prettier",
            "stylua",
            -- lint
            "codespell",
            "eslint_d",
            "phpcs",
            "pylint",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
