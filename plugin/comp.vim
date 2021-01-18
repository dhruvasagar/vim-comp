command! CompRun :call comp#run()
nnoremap c<CR> :CompRun<CR>

command! CompRunLast :call comp#run_last()
nnoremap <Leader>rl :CompRunLast<CR>

command! CompTimeRun :call comp#time_run()
nnoremap <Leader>rt :CompTimeRun<CR>

command! CompRunTest :call comp#run_test()
nnoremap d<CR> :CompRunTest<CR>

command! -nargs=* -complete=filetype CompCreate call comp#create(<f-args>)

command! -nargs=1 Compedit call comp#edit('edit', <q-args>)
command! -nargs=1 Compsplit call comp#edit('split', <q-args>)
command! -nargs=1 Compvsplit call comp#edit('vsplit', <q-args>)
command! -nargs=1 Comptabedit call comp#edit('tabe', <q-args>)
