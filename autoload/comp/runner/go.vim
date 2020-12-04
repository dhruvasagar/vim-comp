function! comp#runner#go#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ 'go build',
        \ '-o bin/'.fname,
        \ ffname,
        \]
endfunction

function! comp#runner#go#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#go#timeruncmd(input) abort
  return ['time'] + comp#runner#go#runcmd(a:input)
endfunction
