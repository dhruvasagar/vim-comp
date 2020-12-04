function! comp#runner#cpp#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ "g++",
        \ "-std=c++17",
        \ ffname,
        \ '-o bin/'.fname,
        \]
endfunction

function! comp#runner#cpp#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#cpp#timeruncmd(input) abort
  return ['time'] + comp#runner#cpp#runcmd(a:input)
endfunction
