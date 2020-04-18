function! comp#runner#java#buildcmd() abort
  let ffname = comp#file#full_name()
  return [
        \ 'javac',
        \ '-d bin',
        \ ffname,
        \]
endfunction

function! comp#runner#java#runcmd() abort
  let fname = comp#file#basename()
  return [
        \ 'java',
        \ 'bin/'.fname,
        \ '< input',
        \]
endfunction

function! comp#runner#java#timeruncmd() abort
  return ['time'] + comp#runner#java#runcmd()
endfunction
