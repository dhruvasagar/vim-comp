function! comp#runner#python#buildcmd() abort
  return []
endfunction

function! comp#runner#python#runcmd(input) abort
  let ffname = comp#file#full_name()
  return [
        \ 'python',
        \ ffname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#python#timeruncmd(input) abort
  return ['time'] + comp#runner#python#runcmd(a:input)
endfunction
