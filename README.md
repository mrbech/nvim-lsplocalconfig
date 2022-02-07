# lsplocalconfig

Load project local configurations for [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Configurations are expected to be stored in a `.lsp.json` file in the root of
the project. The plugin tries to resolve the nearest `.lsp.json` file for
opened file. The json follows the configuration format from lspconfig, example:

```json
{
    "hls": {
        "cmd" : ["haskell-language-server-wrapper", "-l", "log.txt", "--lsp"]
    }
}
```

Instead of the normal `lspconfig` setup loop, setup is done via this plugin
(with an optional default config if none is resolved):

```lua
local config = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}
local default_configs = {
  hls = {},
  dartls = {}
}
require'lsplocalconfig'(config, default_configs)
```

## Installation

Install both `nvim-lspconfig` and this plugin:

### Vim Plug

```
Plug 'neovim/nvim-lspconfig'
Plug 'mrbech/nvim-lsplocalconfig'
```
