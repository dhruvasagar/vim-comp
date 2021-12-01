function! comp#runner#rust#buildcmd() abort
  let ffname = comp#file#full_name()
  let fname = comp#file#basename()
  return [
        \ "cargo",
        \ "build",
        \]
endfunction

function! comp#runner#rust#runcmd(input) abort
  let fname = comp#file#basename()
  return [
        \ 'cargo run',
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#rust#timeruncmd(input) abort
  return ['time'] + comp#runner#rust#runcmd(a:input)
endfunction
