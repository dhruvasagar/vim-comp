function! comp#runner#go#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ 'go build',
        \ '-o bin/'.fname,
        \ ffname,
        \]
endfunction

function! comp#runner#go#runcmd() abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< input',
        \]
endfunction

function! comp#runner#go#timeruncmd() abort
  return ['time'] + comp#runner#go#runcmd()
endfunction
