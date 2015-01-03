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
  let s:command = "read ! rspec ". a:spec_file_name . " --color --tty"
  echo "running rspec " . a:spec_file_name
  execute s:command
  setlocal nomodifiable
  setlocal conceallevel=3
  setlocal syntax=shell-output
endfunction
