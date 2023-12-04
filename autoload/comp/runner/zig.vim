function! comp#runner#zig#buildcmd() abort
  return []
endfunction

function! comp#runner#zig#runcmd(input) abort
  let ffname = comp#file#full_name()
  return [
        \ 'zig',
        \ 'run',
        \ ffname,
        \ '< ' . a:input,
        \]
  endfunction

  function! comp#runner#zig#timeruncmd(input) abort
    return ['time'] + comp#runner#zig#runcmd(a:input)
  endfunction
