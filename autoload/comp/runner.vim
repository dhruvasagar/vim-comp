let g:comp#runner#input = 'input'
let g:comp#runner#test_input = 'tinput'
if !exists('g:comp#runner#cd_to_base')
  let g:comp#runner#cd_to_base = 1
endif

function! s:buildPrefix() abort
  let prefix = ['clear']
  if g:comp#runner#cd_to_base
    call extend(prefix, [
          \ '; cd',
          \ comp#file#full_path(),
          \])
  endif
  return prefix
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
endfunction

function! s:buildCommand(cmdWithArgs) abort
  return s:joinCommands([s:buildPrefix()] + a:cmdWithArgs)
endfunction

function! s:execute(command) abort
  call VimuxRunCommand(a:command)
endfunction

let s:last_cmd = ''
function! comp#runner#run(filetype, ...) abort
  let input = a:0 ? g:comp#runner#test_input : g:comp#runner#input
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let runcmd = comp#runner#{a:filetype}#runcmd(input)
  if !isdirectory('bin') | call mkdir('bin') | endif
  let cmd = s:buildCommand([buildcmd, runcmd])
  let s:last_cmd = cmd
  call s:execute(cmd)
endfunction

function! comp#runner#run_last() abort
  if (!empty(s:last_cmd))
    call s:execute(s:last_cmd)
  endif
endfunction

function! comp#runner#time_run(filetype, ...) abort
  let input = a:0 ? g:comp#runner#test_input : g:comp#runner#input
  let buildcmd = comp#runner#{a:filetype}#buildcmd()
  let timeruncmd = comp#runner#{a:filetype}#timeruncmd(input)
  let cmd = s:buildCommand([buildcmd, timeruncmd])
  let s:last_cmd = cmd
  call s:execute(cmd)
endfunction
