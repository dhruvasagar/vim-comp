function! s:buildPrefix() abort
  return [
        \ 'clear;',
        \ 'cd',
        \ comp#file#full_path(),
        \]
endfunction

function! s:joinCommands(commands) abort
  let commands = []
  for idx in range(len(a:commands))
    let cmd = a:commands[idx]
    let commands += cmd
    if idx < len(a:commands)-1 && !empty(cmd)
      call add(commands, '&&')
    endif
  endfor
  return join(commands, ' ')
endfor
endfunction

function! s:buildCommand(cmdWithArgs) abort
  return s:joinCommands([s:buildPrefix()] + a:cmdWithArgs)
endfunction

function! s:execute(command) abort
  call VimuxRunCommand(a:command)
endfunction

let s:last_cmd = ''
function! comp#runner#run(filetype) abort
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let runcmd = comp#runner#{a:filetype}#runcmd()
  let cmd = s:buildCommand([buildcmd, runcmd])
  let s:last_cmd = cmd
  call s:execute(cmd)
endfunction

function! comp#runner#run_last() abort
  if (!empty(s:last_cmd))
    call s:execute(s:last_cmd)
  endif
endfunction

function! comp#runner#time_run(filetype) abort
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let timeruncmd = comp#runner#{a:filetype}#timeruncmd()
  let cmd = s:buildCommand([buildcmd, timeruncmd])
  let s:last_cmd = cmd
  call s:execute(cmd)
endfunction
