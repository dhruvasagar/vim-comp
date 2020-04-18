function! comp#file#basename()
  return expand('%:t:r')
endfunction

function! comp#file#full_name()
  return expand('%:t')
endfunction

function! comp#file#full_path()
  return expand('%:p:h')
endfunction
