-- lsp/lang/marksman

 local opts = {
   on_attach = require("user.lsp.handlers").on_attach,
   capabilities = require("user.lsp.handlers").capabilities,
   settings = {
     markdown = {
       wikilinks = {
         format = "PascalCase"
       }
     }
   }
 }

 return opts
