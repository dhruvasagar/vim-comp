let g:comp#runner#rust#cd_to_base = 1

function! comp#runner#rust#buildcmd() abort
  return [
        \ "cargo",
        \ "build",
        \]
endfunction

function! comp#runner#rust#runcmd(input) abort
  let fname = comp#file#dirname()
  return [
        \ './target/debug/'.fname,
        \ '< ' . a:input,
        \]
endfunction

function! comp#runner#rust#timeruncmd(input) abort
  return ['time'] + comp#runner#rust#runcmd(a:input)
endfunction
