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
 
 ; Selection sort
 
 ; 1 2 3 5 4 6
 
  mov si,0
  mov cx,5
  p1:
  push cx
  
  mov cx,5
  sub cx,si
  
  mov di, si ;si =0
  inc di    ;di =1
  
  mov bx, si ;bx= 0
  
  p2:
  
  mov dl, asc[bx]
  cmp asc[di],dl
  jnb fp2
  
  mov bx,di
 
  fp2:
  inc di
  loop p2 
  
  mov dl,asc[bx]
  mov al,asc[si]
  
  mov asc[si],dl
  mov asc[bx],al
  
  pop cx 
  inc si
  
  loop p1  
  
  mov di,0
  mov si,5
  mov cx,6
  
  

 insert:  
  

  
  mov dl,asc[si]
  mov des[di],dl
  
  inc di
  dec si
  
  loop insert
  

mov al,des[5]
mov min,al

  
mov al,des[0]
mov max,al  
  
  
  
  
 
 popf
 popa
    ret
    Sort endp


toEnd:
    end main  
