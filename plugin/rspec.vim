if (exists('g:loaded_vim_rspec') && g:loaded_vim_rspec)
  finish
endif
let g:loaded_vim_rspec = 1

augroup vimrc
  autocmd QuickFixCmdPost * botright copen 8
augroup END

command RspecFile call RunSpecFile("rspec")
command RspecLine call RunSpecLine("rspec")

function! RunSpecFile(rspec_command)
  let s:spec_file_name = @%
  silent call RunSpec(a:rspec_command, s:spec_file_name)
endfunction

function! RunSpecLine(rspec_command)
  let s:spec_file_name = @% . ':' . line(".")
  silent call RunSpec(a:rspec_command, s:spec_file_name)
endfunction

function! DisplayRspecOutput()
  setlocal syntax=shell-output
  setlocal conceallevel=3
  setlocal concealcursor=nv
  call asyncrun#quickfix_toggle(8, 1)
  execute "wincmd p"
endfunction

function! RunSpec(rspec_command, spec_file_name)
  execute ":AsyncRun -strip -post=call\\ DisplayRspecOutput() " . a:rspec_command . " " . a:spec_file_name . " --color --tty"
endfunction

