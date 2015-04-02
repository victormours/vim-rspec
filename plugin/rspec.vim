if (exists('g:loaded_vim_rspec') && g:loaded_vim_rspec)
  finish
endif
let g:loaded_vim_rspec = 1

command RspecFile call RunSpecFile("rspec")
command RspecLine call RunSpecLine("rspec")

function! RunSpecFile(rspec_command)
  let s:spec_file_name = @%
  call RunSpec(a:rspec_command, s:spec_file_name)
endfunction

function! RunSpecLine(rspec_command)
  let s:spec_file_name = @% . ':' . line(".")
  call RunSpec(a:rspec_command, s:spec_file_name)
endfunction

function! RunSpec(rspec_command, spec_file_name)
  new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap

  let s:command = "read ! " . a:rspec_command . " " . a:spec_file_name . " --color --tty"
  echo "running rspec " . a:spec_file_name
  silent execute s:command
  setlocal nomodifiable
  setlocal conceallevel=3
  setlocal concealcursor=nv
  setlocal syntax=shell-output
endfunction
