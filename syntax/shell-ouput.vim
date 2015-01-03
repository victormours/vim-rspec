syntax region green start=/\(\e\[32m\)\@<=/ end=/\(\e\[0m\)\@=/
syntax region red start=/\(\e\[31m\)\@<=/ end=/\(\e\[0m\)\@=/
syntax region cyan start=/\(\e\[36m\)\@<=/ end=/\(\e\[0m\)\@=/

syntax match colorEscapeSequence /\e\[\d\+m/ conceal

highlight link green Statement
highlight link red Error


