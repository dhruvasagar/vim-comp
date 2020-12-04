function! comp#runner#ruby#buildcmd() abort
  return []
endfunction

function! comp#runner#ruby#runcmd(input) abort
  let ffname = comp#file#full_name()
  return [
        \ 'ruby',
        \ ffname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#ruby#timeruncmd(input) abort
  return ['time'] + comp#runner#ruby#runcmd(a:input)
endfunction
