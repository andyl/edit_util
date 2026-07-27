-- Enable filetype detection
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

vim.cmd([[
augroup deno_shebang
  autocmd!
  autocmd BufRead * if getline(1) =~ '^#!.*\vdeno' | setfiletype javascript | endif
augroup END

augroup rust_shebang
  autocmd!
  autocmd BufRead * if getline(1) =~ '^#!.*\vrust-script' | setfiletype rust | endif
augroup END

augroup python_uv_shebang
  autocmd!
  autocmd BufRead * if getline(1) =~ '^#!.*uv run.*--script' | setfiletype python | endif
augroup END
]])

vim.filetype.add({
  extension = {
    bean = "beancount",
    beancount = "beancount",
  },
})

