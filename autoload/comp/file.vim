function! comp#file#basename()
  return expand('%:t:r')
endfunction

function! comp#file#full_name()
  return expand('%:t')
endfunction

function! comp#file#full_path()
  return expand('%:p:h')
endfunction

function! comp#file#dirname()
  return expand('%:p:h:h:t')
endfunction

function! comp#file#basedir()
  return expand('%:p:h:h')
endfunction
