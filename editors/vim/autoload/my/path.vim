" autoload/my/path.vim - Global helpers for dealing with file paths
" Maintainer:   Noah Frederick

let g:compiled_file_locations = {
      \ 'less':   [['.', '.css'],    ['../css', '.css'],  ['.', 'bootstrap.css'],   ['..', 'style.css']],
      \ 'sass':   [['.', '.css'],    ['../css', '.css'],  ['.', 'application.css'], ['..', 'application.css']],
      \ 'scss':   [['.', '.css'],    ['../css', '.css'],  ['.', 'application.css'], ['..', 'application.css']],
      \ 'jade':   [['.', '.html'],   ['..', '.html']],
      \ 'haml':   [['.', '.html'],   ['..', '.html']],
      \ 'js':     [['.', '.min.js']],
      \ 'coffee': [['.', '.min.js'], ['../js', '.js']],
      \ 'md':     [['.', '.pdf']],
      \ }

function! my#path#find_compiled_version(path)
  let l:ext = fnamemodify(a:path, ':e')

  if has_key(g:compiled_file_locations, l:ext)
    return my#path#find_alternate_file(a:path, g:compiled_file_locations[l:ext])
  endif

  return ''
endfunction

function! my#path#find_alternate_file(path, alternates)
  let l:head = fnamemodify(a:path, ':h')
  let l:base = fnamemodify(a:path, ':t:r')

  for [l:dir, l:suffix] in a:alternates
    let l:new_path = s:construct_path_with_new_suffix(l:head, l:dir, l:base, l:suffix)
    if filereadable(l:new_path)
      return l:new_path
    endif
  endfor

  return ''
endfunction

function! s:construct_path_with_new_suffix(head, dir, base, new_suffix)
  if a:new_suffix[0] ==# '.'
    let l:filename = a:base . a:new_suffix
  else
    let l:filename = a:new_suffix
  endif
  return resolve(a:head . '/' . a:dir . '/' . l:filename)
endfunction

function! my#path#complete_head(path_prefix, filename_pattern, A, L, P)
  let matches = globpath(a:path_prefix, '**/' . a:A . a:filename_pattern, 0, 1)
  return map(matches, 'fnamemodify(v:val, ":s?' . a:path_prefix . '/??:r")')
endfunction

" Follow symlink to actual file
function! my#path#follow_symlink()
  " Get path of actual file
  let fname = resolve(expand("%:p"))
  " Rename buffer with new path
  execute "file " . fname
  " Read file again to trigger any plug-ins that are context-sensitive
  edit
endfunction

""
" Remove {prefix} and everything before it from {path}, returning the result
function! my#path#remove_prefix(prefix, path)
  if type(a:prefix) ==# type([])
    let prefixes = a:prefix
  else
    let prefixes = [a:prefix]
  endif

  let path = '/' . a:path

  for prefix in prefixes
    let pos = stridx(path, prefix)
    if pos != -1
      return strpart(path, pos + strlen(prefix))
    endif
  endfor

  return a:path
endfunction

