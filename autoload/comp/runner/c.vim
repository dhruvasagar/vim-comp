function! comp#runner#c#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ "gcc",
        \ ffname,
        \ '-o bin/'.fname,
        \]
endfunction

function! comp#runner#c#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#c#timeruncmd(input) abort
  return ['time'] + comp#runner#c#runcmd(a:input)
endfunction
