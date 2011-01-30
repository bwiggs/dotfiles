
" workaround: document include files in comments (for [I, [D)
setlocal include=//\ dependency:

" for [D, ctrl-w ctrl-d and the like
setlocal define=^\\(\\S*.prototype.\\\\|\\s*var\\s*\\\\|\\s*function\\s*\\)

" generate doc comment template
map <LocalLeader>/ :call GenerateDOCComment()<cr>

function! GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let paramstart = matchend(text,'(')
  let paramPat   = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg text
  let vars = []
    let m    = ' '
    let ml = matchlist(text,paramPat,paramstart)
    while ml!=[]
      let [_,var;rest]= ml
      let vars += [pre.' * @param '.var]
      let ml = matchlist(rest,paramPat,0)
    endwhile
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction
