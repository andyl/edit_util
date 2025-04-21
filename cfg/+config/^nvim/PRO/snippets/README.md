# SNIPPETS README

## Overview 

- blink.cmp reads vscode-style snippets (JSON)
- snipmate style snippets are easier to write 
- use a converter

## Reference 

- Snippets  | https://cmp.saghen.dev/configuration/snippets
- Converter | https://github.com/nadiamoe/snipmate-to-json

## Converter 

```
$ go install go.nadia.moe/snipmate-to-json@latest
$ asdf reshim 
$ snipmate-to-json < markdown.snippets | jq > markdown.json
```


