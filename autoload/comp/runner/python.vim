function! comp#runner#python#buildcmd() abort
  return []
endfunction

function! comp#runner#python#runcmd() abort
  let ffname = comp#file#full_name()
  return [
        \ 'python',
        \ ffname,
        \ '< input',
        \]
endfunction

function! comp#runner#python#timeruncmd() abort
  return ['time'] + comp#runner#python#runcmd()
endfunction
