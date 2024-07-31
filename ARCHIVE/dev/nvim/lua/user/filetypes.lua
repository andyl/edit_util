-- Enable filetype detection
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Define a new filetype for Deno shebangs
vim.cmd([[
augroup deno_shebang
  autocmd!
  autocmd BufRead * if getline(1) =~ '^#!.*\vdeno' | setfiletype javascript | endif
augroup END

augroup rust_shebang
  autocmd!
  autocmd BufRead * if getline(1) =~ '^#!.*\vrust-script' | setfiletype rust | endif
augroup END
]])

