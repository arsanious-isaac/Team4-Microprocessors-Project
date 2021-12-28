.model small


;MINA
.data   ;define variables


.code   ;the executable part of the program



;MINA
printC macro character



;MINA
printM macro string




;YOUSSEF
root macro value






;YOUSSEF
main proc  



;ARSANI
read proc      




;MARK
checkN proc
 pusha
 pushf 

 mov flag, 0


 cmp input, '0'
 jb errorVar 
 
 
 popf
 popa

 ret
 checkN endp 



;MARK
checkC proc



;CLARA
clear proc  



;ARSANI
SelectOperation proc



;MARK
StandardOperation proc



;CLARA
avgOperation proc






;CLARA
Sort proc
pusha
 pushf
 
 mov cx,6
 mov si,0
 
 addTo:
 
 mov dl, nums[si]
 mov asc[si],dl
 
 inc si
 
 loop addTo
 
  mov si,0
  mov cx,5




    Sort endp


toEnd:
    end main  
