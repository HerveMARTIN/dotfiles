" autoload/my/snippets.vim - Global helpers for snippets

function! my#snippet#title(basename)
  if exists("g:template_title")
    " Setting g:template_title lets us override the title (once)
    let title = g:template_title
    unlet g:template_title
    return title
  endif
  if exists("b:template_title")
    " Setting b:template_title also lets us override the title
    return b:template_title
  endif
  " Otherwise derive from file's basename
  let title = substitute(a:basename, '\C\(\l\)\(\u\|\d\)', '\1_\l\2', 'g')
  let title = substitute(title, '^.', '\u&', 'g')
  let title = substitute(title, '_\(.\)', ' \u\1', 'g')
  return title
endfunction

function! my#snippet#expand_snippet_or_complete_maybe()
  call UltiSnips#ExpandSnippetOrJump()

  if !exists("g:ulti_expand_or_jump_res") || g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      return "\<Tab>"
    endif
  endif

  return ""
endfunction

