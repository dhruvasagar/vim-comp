function! comp#runner#java#buildcmd() abort
  let ffname = comp#file#full_name()
  return [
        \ 'javac',
        \ '-d bin',
        \ ffname,
        \]
endfunction

function! comp#runner#java#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ 'java',
        \ 'bin/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#java#timeruncmd(input) abort
  return ['time'] + comp#runner#java#runcmd(a:input)
endfunction
