function! comp#runner#haskell#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ "ghc",
        \ ffname,
        \ '-o bin/'.fname,
        \]
endfunction

function! comp#runner#haskell#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#haskell#timeruncmd(input) abort
  return ['time'] + comp#runner#haskell#runcmd(a:input)
endfunction
