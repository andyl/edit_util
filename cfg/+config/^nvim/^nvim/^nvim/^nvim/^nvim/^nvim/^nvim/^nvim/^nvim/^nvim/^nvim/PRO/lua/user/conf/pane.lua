-- conf/pane

vim.cmd [[
" === PANE RESIZING (Up/Down)
fun! BarUp(lines)
  let curwindow = winnr()   " save current window
  wincmd k                  " move to a upper-window
  if winnr() == curwindow   " if top-most window
    execute 'resize -' . a:lines
  else
    wincmd j              " else move to the lower-window
    execute 'resize +' . a:lines
  endif
endfun

fun! BarDown(lines)
  let curwindow = winnr() " save current window
  wincmd j                " move to a lower-window
  if winnr() == curwindow " if bottom-most window
    execute 'resize -' . a:lines
  else
    wincmd k              " else move to the upper-window
    execute 'resize +' . a:lines
  endif
endfun

" === PANE RESIZING (Left/Right)
fun! BarLeft(lines)
  let curwindow = winnr() " === save current window
  wincmd h                " move to a left-window
  if winnr() == curwindow " if left-most window
    execute 'vertical resize -' . a:lines
  else
    wincmd l              " else move to the right-window
    execute 'vertical resize +' . a:lines
  endif
endfun

fun! BarRight(lines)
  let curwindow = winnr() " save current window
  wincmd l                " move to a right-window
  if winnr() == curwindow " if right-most window
    execute 'vertical resize -' . a:lines
  else
    wincmd h              " else move to the left-window
    execute 'vertical resize +' . a:lines
  endif
endfun

]]
