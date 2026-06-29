" markdownWikiLink is a new region
syn region markdownWikiLink matchgroup=markdownLinkDelimiter start="\[\[" end="\]\]" contains=markdownUrl keepend oneline concealends
" markdownLinkText is copied from runtime files with 'concealends' appended
syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends
" markdownLink is copied from runtime files with 'conceal' appended
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal

" colon separated tags highlight :one:two:three:
" Match anything starting with a colon followed by alphanumeric characters
syn match TagPattern ':[a-zA-Z0-9]\+\(:[a-zA-Z0-9]\+\)*' 

" Link the pattern to a highlight group
hi def link TagPattern Statement

" To add underline
hi TagPattern cterm=underline gui=underline ctermfg=blue guifg=blu
