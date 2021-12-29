.model small


;MINA
.data   ;define variables
;Numbers msg
enterMsg db 10,13,10,13,"Enter 6 numbers <between 0 and 9> ",10,13,"then perform some arithmetic operations on them ",10h,10,13,'$'

num db 10,13,"Enter the number $"
n   db '1','2','3','4','5','6','$'
space db 3Ah,09h,'$'
tyMsg db 10,13,10,13,"thank you for entering all numbers ",03h,10,13,'$'
finishMsg db 10,13,10,13,"thank you for use my project ",03h,10,13,'$'

;Options msg
selectMsg db 10,13,10,13,"Please select the operation you need",10,13,"<v,x,n,,d,a,e,s,l,q,r or ? for help> ",10h,'$'
optionsMsg db                  10,13,
           db                  "v: for average",10,13,
           db                  "x: for max",10,13,
           db                  "n: for min",10,13,
           db                  "e: for standard deviation",10,13,
           db                  "a: to show numbers in ascending order",10,13,
           db                  "d: to show numbers in descending order",10,13,
           db                  "s: summation of all numbers",10,13,
           db                  "l: for all the above",10,13,
           db                  "q: to quit",10,13,
           db                  "r: to enter 6 new numbers",10,13
           db                  "?: for help",10,13,'$'
           
;Error msg
errorChar db 10,13,10,13,"Unrecognized character",10,13,'$'
errorNum db 10,13,10,13 ,"The character you entered is not in the range from 0 to 9",10,13,'$'



.code   ;the executable part of the program



;MINA
printC macro character



;MINA
printM macro string




;Youssef(multiple function)
; result = n1*n2

mulO macro n1,n2
pusha
pushf

mov ax,0;
mov al,n1
mul n2   ; the value is stored in AX register
mov result,al

popf
popa
mulO endm



;YOUSSEF


;root function
;result = value^0.5
root macro value
pusha
popf
call clear

mov dl,value
mov value,0
mov regShift,00001000b ;it keeps right sgifting
mov reg,00001000b ; it keeps track of all steps
mov save,0
mov cx,4





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
    
mov ax, 0     
mov bx, 0   
mov dx, 0
mov cx, 0
mov si, 0 
mov di, 0
mov flag, 0 
    
    
     ret
    clear endp


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
