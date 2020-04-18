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

function! comp#runner#cpp#runcmd() abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< input',
        \]
endfunction

function! comp#runner#cpp#timeruncmd() abort
  return ['time'] + comp#runner#cpp#runcmd()
endfunction
