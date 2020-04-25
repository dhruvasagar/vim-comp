function! comp#run() abort
  call comp#runner#run(&filetype)
endfunction

function! comp#time_run() abort
  call comp#runner#time_run(&filetype)
endfunction

function! comp#run_last() abort
  call comp#runner#run_last()
endfunction

function! comp#edit(cmd, fname) abort
  exe a:cmd a:fname
  exec ':0r ~/dotfiles/templates/' . &filetype . '/file.' . expand('%:e')
endfunction

let s:extn_map = {
      \ 'ruby': 'rb',
      \ 'python': 'py',
      \ 'haskell': 'hs',
      \}
function! comp#create(lang, name) abort
  let pwd = expand("%:h:p")
  cd ..
  silent exec '!comp create' a:lang a:name | redraw!
  exec 'cd' a:name
  exec 'edit' a:name.".".get(s:extn_map, a:lang, a:lang)
endfunction
