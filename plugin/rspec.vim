command RspecFile call RunSpecFile()
command RspecLine call RunSpecLine()

function! RunSpecFile()
  let s:spec_file_name = @%
  call RunSpec(s:spec_file_name)
endfunction

function! RunSpecLine()
  let s:spec_file_name = @% . ':' . line(".")
  call RunSpec(s:spec_file_name)
endfunction

function! RunSpec(spec_file_name)
  new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap

  if exists("g:rspec_command")
    let s:rspec_command = g:rspec_command
  else
    let s:rspec_command = "rspec"
  endif

  let s:command = "read ! " . s:rspec_command . " " . a:spec_file_name . " --color --tty"
  echo "running rspec " . a:spec_file_name
  silent execute s:command
  setlocal nomodifiable
  setlocal conceallevel=3
  setlocal concealcursor=nv
  setlocal syntax=shell-output
endfunction
