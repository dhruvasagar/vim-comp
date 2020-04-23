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
