
 " we need the conceal feature (vim ≥ 7.3)
 if !has('conceal')
     finish
 endif
 
 " remove the keywords. we'll re-add them below
  if ! &ft
     finish
  endif
 
 
 let commentType=&ft."Comment"

 syntax cluster matchi add=&ft."Comment"
 syntax match matchComment "" contains=@matchi conceal cchar=Ξ
 
 hi! link matchComment Comment
 set conceallevel=2

 nnoremap <silent> <leader>C :call comceal#toggle()<CR>

fun! comceal#toggle() 
    if !exists('s:counter') 
        let s:counter = 0 
    else 
        let s:counter += 1 
        let s:counter = s:counter % 3 
    endif 
    setlocal conceallevel=s:counter  
endfun  
