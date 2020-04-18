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

function! comp#runner#run(filetype) abort
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let runcmd = comp#runner#{a:filetype}#runcmd()
  call s:execute(s:buildCommand([buildcmd, runcmd]))
endfunction

function! comp#runner#time_run(filetype) abort
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let timeruncmd = comp#runner#{a:filetype}#timeruncmd()
  call s:execute(s:buildCmd([buildcmd, timeruncmd]))
endfunction
