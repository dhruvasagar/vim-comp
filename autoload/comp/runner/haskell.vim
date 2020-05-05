function! comp#runner#haskell#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ "ghc",
        \ ffname,
        \ '-o bin/'.fname,
        \]
endfunction

function! comp#runner#haskell#runcmd() abort
  let fname = comp#file#basename()
  return [
        \ './bin/'.fname,
        \ '< input',
        \]
endfunction

function! comp#runner#haskell#timeruncmd() abort
  return ['time'] + comp#runner#haskell#runcmd()
endfunction
