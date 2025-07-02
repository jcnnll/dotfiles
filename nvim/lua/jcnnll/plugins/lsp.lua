return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        "saghen/blink.cmp",
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end
                map("rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gs", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
                map("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
                map("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
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

        local lspconfig = require("lspconfig")

        for server_name, config in pairs(servers) do
            config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
            lspconfig[server_name].setup(config)
        end
    end,
}
