-- vimcmd
--------------------------------------------------------

-- COMMANDS
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- STRIP TRAILING WHITESPACE
-- see http://vimcasts.org/episodes/tidying-whitespace/
-- to show non-printable characters - :set list
-- to hide non-printable characters - :set nolist

vim.cmd [[
function! StripTrailingWhitespaces()
  " Prep: save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business
  %s/\s\+$//e
  " Cleanup: restore previous search history and cursor position
  let @/=_s
  call cursor(l,c)
endfunction

" call function before saving
autocmd BufWritePre *.lua,*.ex,*.exs,*.rb,*.erb :call StripTrailingWhitespaces()

" " === SPEED DATING
" autocmd BufRead,BufNewFile *.md      1SpeedDatingFormat %Y %h %d %i

" === FILE MODES
autocmd BufRead,BufNewFile *.thor    set filetype=ruby
autocmd BufRead,BufNewFile *.gtd     set filetype=gtd
autocmd BufRead,BufNewFile *.gta     set filetype=gtd

" === TABLE MODE
let g:table_mode_corner = '|'
let g:table_mode_corner_corner = '|'

" === BULLETS.VIM
let g:bullets_checkbox_markers = ' .-x'

" === MARKDOWN FOLDING
let g:markdown_folding = 1
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set syntax=markdown
autocmd FileType markdown setlocal foldlevel=99
]]

