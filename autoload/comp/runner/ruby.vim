function! comp#runner#ruby#buildcmd() abort
  return []
endfunction

function! comp#runner#ruby#runcmd() abort
  let ffname = comp#file#full_name()
  return [
        \ 'ruby',
        \ ffname,
        \ '< input',
        \]
endfunction

function! comp#runner#ruby#timeruncmd() abort
  return ['time'] + comp#runner#ruby#runcmd()
endfunction
