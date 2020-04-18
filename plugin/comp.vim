command! CompRun :call comp#run()
nnoremap c<CR> :CompRun<CR>

command! CompTimeRun :call comp#time_run()

command! -nargs=1 Compedit call comp#edit('edit', <q-args>)
command! -nargs=1 Compsplit call comp#edit('split', <q-args>)
command! -nargs=1 Compvsplit call comp#edit('vsplit', <q-args>)
command! -nargs=1 Comptabedit call comp#edit('tabe', <q-args>)
