" autoload/my/puppet.vim - Puppet file-type helpers

""
" Infer the class name from file's path.
"
" Example:
"   site/profiles/manifests/foo.pp -> profiles::foo
"   site/roles/manifests/foo.pp -> roles::foo
function! my#puppet#path_to_class_name(...)
  if a:0
    let path = a:1
  else
    let path = expand('%:p')
  endif

  let suffix = my#path#remove_prefix('/site/', path)

  if suffix ==# path
    let suffix = fnamemodify(suffix, ':t')
  endif

  let suffix = substitute(suffix, '/manifests/', '/', '')

  return substitute(fnamemodify(suffix, ':r'), '/', '::', 'g')
endfunction
