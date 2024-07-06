# A guide on how to maintain and update the configuration
This is mostly made for me, because i forget so easily how to do different stuff:D 
This includes stuff such as:
- How to install and configure a new LSP server.
- That's it as of today. Might update this some day in the future.

### How to install and configure a new LSP server.
To install and configure a new LSP server, use the Mason plugin to install the server.
Mason is a tool which installs the LSPs on your system so you don't have to. Without Mason
you'd have to install every single language server through, for example npm.
Run the following command to see language  servers available for install.
```
:Mason
```
Now navigate to the (2) LSP section and install the language server you want.
Anter it's been installed move to `lua/plugins/lsp-config.lua.` and add the following
piece of code to the config function.
```lua
lspconfig.language_server_name.setup({
    capabilities = capabilities,
})
```
**That's it**, you should be good to go!

### DOCUMENTATION:
- [Configuring a new formatter](https://github.com/stevearc/conform.nvim)
