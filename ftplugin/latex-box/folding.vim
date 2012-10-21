" Folding support for LaTeX
"
" Options
" g:LatexBox_Folding       - Turn on/off folding
" g:LatexBox_fold_parts    - Define which sections and parts to fold
" g:LatexBox_fold_envs     - Turn on/off folding of environments
" g:LatexBox_fold_preamble - Turn on/off folding of preamble
"

" {{{1 Set options
if exists('g:LatexBox_Folding')
    setl foldmethod=expr
    setl foldexpr=LatexBox_FoldLevel(v:lnum)
    setl foldtext=LatexBox_FoldText(v:foldstart)
endif
if !exists('g:LatexBox_fold_preamble')
    let g:LatexBox_fold_preamble=1
endif
if !exists('g:LatexBox_fold_envs')
    let g:LatexBox_fold_envs=1
endif
if !exists('g:LatexBox_fold_parts')
    let g:LatexBox_fold_parts=[
                \ "part",
                \ "chapter",
                \ "section",
                \ "subsection",
                \ "subsubsection"
                \ ]
endif
if !exists('g:LatexBox_not_fold')
    let g:LatexBox_not_fold=[
                \ "appendix",
                \ "frontmatter",
                \ "mainmatter",
                \ "backmatter"
                \ ]
endif

function s:Detect_fold_level(delim)
    let s:LatexBox_fold_parts = []
    for i in range(len(g:LatexBox_fold_parts))
        if search('\\' . g:LatexBox_fold_parts[i] . '\*\?\s*{', 'n')
            call add(s:LatexBox_fold_parts, g:LatexBox_fold_parts[i])
        end
    endfor
    return index(s:LatexBox_fold_parts, a:delim)
endfunction

" {{{1 LatexBox_FoldLevel
function! LatexBox_FoldLevel(lnum)
    let nlnum = nextnonblank(a:lnum)
    let line = getline(nlnum)
    let baselevel = (g:LatexBox_fold_envs==1)

    " Fold preamble
    if g:LatexBox_fold_preamble==1
        if nlnum == a:lnum && line =~ '\s*\\documentclass'
            if search('\s*\\begin{document}', 'n') > nlnum +1
                return ">1"
            else
                return 0
            endif
        elseif nlnum > a:lnum && line =~ '\s*\\begin{document}'
            return 0
        endif
    endif

    " Don't fold \frontmatter \mainmatter \backmatter \appendix
    if line =~ '^\s*\\\%('.join(g:LatexBox_not_fold, '\|') . '\)'
        return baselevel
    endif

    " Fold parts and sections
    let delim = matchstr(line, '^\s*\\\zs\%(' . join(g:LatexBox_fold_parts, '\|') . '\)\ze\*\?\s*{')
    if !empty(delim)
        if  nlnum == a:lnum
            return ">" . (s:Detect_fold_level(delim)+ baselevel + 1)
        else
            return (s:Detect_fold_level(delim)+ baselevel)
        endif
    endif

    " Fold environments
    if line =~ '\\end\s*{document}'
        return baselevel
    endif
    if g:LatexBox_fold_envs==1
        if nlnum == a:lnum
            if line =~ '\\begin\s*{.\{-}}'
                return "a1"
            elseif line =~ '\\end\s*{.\{-}}'
                return "s1"
            endif
        endif
    endif

    return "="
endfunction

" {{{1 LatexBox_FoldText
function! LatexBox_FoldText(lnum)
    let line = getline(a:lnum)

    " Define pretext
    let pretext = '    '
    if v:foldlevel == 1
        let pretext = '>   '
    elseif v:foldlevel == 2
        let pretext = '->  '
    elseif v:foldlevel == 3
        let pretext = '--> '
    elseif v:foldlevel >= 4
        let pretext = printf('--%i ',v:foldlevel)
    endif

    " Preamble
    if line =~ '\s*\\documentclass'
        return pretext . "Preamble" . ' '
    endif

    " Parts and sections
    if line =~ '\\\(\(sub\)*section\|part\|chapter\)'
        let title = matchlist(line, '^\s*\\\(\%(sub\)*section\|part\|chapter\)\*\?{\(.*\)}')
        if empty(title)
            let title = matchlist(line, '^\s*\\\(\%(sub\)*section\|part\|chapter\)\*\?{\(.*\)')
        endif
        return pretext . substitute(title[1], '^\(.\)' , '\u\1', '') . ': ' . title[2] . ' '
    endif

    " Environments
    if line =~ '\\begin'
        let env = matchstr(line,'\\begin\*\?{\zs.\{-}\ze}')
        if env == 'document'
            return pretext. "Document"
        endif
        let label = ' '
        let caption = ''
        let env = '[' . env . ']'
        let i = v:foldstart
        while i <= v:foldend
            if getline(i) =~ '^\s*\\label'
                let label = ' (' . matchstr(getline(i),
                            \ '^\s*\\label{\zs.*\ze}') . ') '
            end
            if getline(i) =~ '^\s*\\caption'
                let env .=  ': '
                let caption = matchstr(getline(i),
                            \ '^\s*\\caption\(\[.*\]\)\?{\zs.\{1,30}')
                let caption = substitute(caption, '}\s*$', '','')

            end
            let i += 1
        endwhile
        return pretext . env . caption . label
    endif

    " Not defined
    return "Fold text not defined"
endfunction

" {{{1 Footer
" vim:fdm=marker:ff=unix:ts=4:sw=4
