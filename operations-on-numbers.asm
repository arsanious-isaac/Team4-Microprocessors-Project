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
;Operations msg

sumMsg db 10,13,"The sum of all numbers is :$"
avgMsg db 10,13,"The average is : $"
maxMsg db 10,13,"the max number is : $"
minMsg db 10,13,"The min number is : $"
sdMsg db 10,13,"the standard deviation is : $"
ascMsg db 10,13,"Numbers in ascending order : $"
desMsg db 10,13,"Number in descending order : $"

allMsg db 's','v','x','n','e','a','d'


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
lop1:
push cx

mulO reg,reg
cmp result,dl
ja leave

mov bl,reg
or value,bl

mov bl,value
or save,bl

shr regShift,1

mov bl ,regShift
or reg,bl

jmp finish

leave:

shr regShift,1
mov bl,save
mov reg, bl

mov bl,regShift
or reg,bl

finish: 
pop cx
loop lop1

mov dl, value
mov result,dl

popf
popa
root endm


;YOUSSEF
main proc  



;ARSANI
read proc      
    pusha
    pushf 
    mov ah,1h
    int 21h
    mov input, al       
    popf
    popa
    ret
    read endp 


;MARK
checkN proc
 pusha
 pushf 

 mov flag, 0

 cmp input, '0'
 jb errorVar 
 
 cmp input, '9'
 ja errorVar

 jmp endCheckN

 errorVar:
 mov flag, 1

 endCheckN:
 popf
 popa

ret
checkN endp 


;MARK
checkC proc
pusha
    pushf 
    
    mov flag,0
    
    cmp input,'v'
    je endCheckC 
    
    cmp input,'x'
    je endCheckC
     
    cmp input,'n'
    je endCheckC
      
    cmp input,'d'
    je endCheckC 
    
    cmp input,'a'
    je endCheckC
    
    cmp input,'e'
    je endCheckC
     
    cmp input,'s'
    je endCheckC 
    
    cmp input,'l'
    je endCheckC 
    
    cmp input,'q'
    je endCheckC 
    
    cmp input,'r'
    je endCheckC 
    
    cmp input,'?'
    je endCheckC 
    
    errorExist:
    mov flag,1
    
    endCheckC:
    popf
    popa
    
    ret
    checkC endp    


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
 pusha
 pushf
 
    mov dl, input
    mov compareReg,dl

    L0:
    cmp compareReg ,'?'
    jne L1
    
    printM optionsMsg 
    jmp finishSelect
    
    
    L1:
    cmp compareReg ,'r'
    jne L2
    
    jmp repeat
    
    L2:
    cmp compareReg ,'q'
    jne L3
         
    jmp toEnd
    
    L3:
    cmp compareReg ,'v'
    jne L4
    
    printM avgMsg
    printC avg
    jmp finishSelect
    
    
    L4: 
    cmp compareReg ,'x'
    jne L5
    
    printM maxMsg
    printc max
    jmp finishSelect
    
     
    L5: 
    cmp compareReg ,'n'
    jne L6
    
    printM minMsg
    printc min
    jmp finishSelect 
    
    
    L6:
    cmp compareReg ,'e'
    jne L7
    
    printM sdMsg
    printc standard
    jmp finishSelect
    
    
    L7: 
    cmp compareReg ,'s'
    jne L8
    
    printM sumMsg
    
    mov ax, 0
    mov al, sum
    
    aam
    or ax,3030h
    
    printC ah
    printC al
    
    jmp finishSelect
    
    L8:
    cmp compareReg ,'a'
    jne L9
    
    printM ascMsg
    
    mov cx ,6
    mov si,0
    
    printAsc:
    
    printc asc[si]
    inc si
    
    loop printAsc
    
    jmp finishSelect
    
    
    L9:  
    cmp compareReg ,'d'
    jne L10
    
     printM desMsg
    
    mov cx ,6
    mov si,0
    
    printDes:
    
    printc des[si]
    inc si
    
    loop printDes
    jmp finishSelect
    
    
    L10:
    cmp compareReg ,'l'
    jne finishSelect
    
    mov cx,7
    mov di,0
    
    printAll:
    push cx
    push di
    
   mov dl,allMsg[di]
   mov input,dl
   
   call selectOperation 
    

    pop di
    pop cx
    inc di
    loop printAll
    
     
 finishSelect:
 popf
 popa
  ret
  SelectOperation endp

;MARK
StandardOperation proc



avgOperation proc
 pusha
 pushf
 mov sum,0   ;memory conflicts with nums array~~~
 mov avg,0   ------------------------------------         
 mov cx ,6
 mov si ,0
 
 sumLoop:
 mov dl, nums[si] 
 sub dl,30h
 add sum,dl
 inc si
 loop sumLoop
 mov dl,6
 divO sum,dl
 mov al , result
 add al,30h
 mov avg, al  
 popf
 popa
    ret
    avgOperation endp

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
