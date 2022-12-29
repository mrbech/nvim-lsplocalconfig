return function (config, default_configs) 
    local resolve = require('lsplocalconfig/resolve')
    local util = require('lsplocalconfig/util')
    local lsp_config_name = '.lsp.json'
    local nearest = resolve.nearest(lsp_config_name)
    local configs = {}
    if nearest then
        configs = vim.json.decode(util.read_all(nearest))
    elseif default_configs then
        configs = default_configs
    end
    for lsp, c in pairs(configs) do
      local lsp_config = {}
      for k, v in pairs(config) do
          lsp_config[k] = v
      end
      for k, v in pairs(c) do
          lsp_config[k] = v
      end
      require'lspconfig'[lsp].setup(lsp_config)
    end
end
