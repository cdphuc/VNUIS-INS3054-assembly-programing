
.model small
.stack 100h
.data 
    
    input_password db 'Please Enter Your Password: $'
    tryagain db "Try Again? (1/0): $"
    key_message db  'Press any key to continue... $'
    password db 'group5$'
    incorrect_password db 10,13, 'Incorrect Password$'
        
    welcome db 10,13,10,13, 'WELCOME TO MEDICAL STORE$'
    msg1 db 10,13,10,13, 'Choose a Option: $'
    msg2 db 10,13,10,13, 'What Do You Want To Buy$'
    msg_medicines db 10,13, 'Press 1 to buy medicines$'
    medicines_sold db 10,13, 'Press 2 to see medicines statistics$'
    input_again db 10,13, 'Please Press one of the above given keys$'
    wrong_input db 10,13, 'Wrong Input$'
    exit_program db 10,13,'Press 4 to exit$'
    
    newLine db 10,13, '$' 
    
    opt1 db 10,13, '1. Panadol - 4rs$'
    opt2 db 10,13, '2. Paracetamol - 3rs$'
    opt3 db 10,13, '3. Cleritek - 2rs$'
    opt4 db 10,13, '4. Aspirin - 2rs$'
    opt5 db 10,13, '5. Brufen - 1rs$'

    msg_panadol db 10,13, 'How many panadols do you want to buy: $'
    msg_paracetamol db 10,13, 'How many paracetamol do you want to buy: $'
    msg_cleritek db 10,13, 'How many cleritek do you want to buy: $'
    msg_aspirin db 10,13, 'How many aspirin do you want to buy: $'
    msg_brufen db 10,13, 'How many brufen do you want to buy: $'
    total_msg db 10,13,'Total Earned= $'

    amount_earned db 10,13,'Amount earned= $'
    amount dw 0
    amount_print db 10,13,'Press 3 to show amount earned today$'
    
    panadol_sold dw 0
    paracetamol_sold dw 0
    cleritek_sold dw 0
    aspirin_sold dw 0
    brufen_sold dw 0
    
    price_panadol db 4
    price_paracetamol db 3
    price_cleritek db 2    
    price_aspirin db 2
    price_brufen db 1
    
    panadol_print db 10,13, 'Panadols sold = $'
    aspirin_print db 10,13, 'Aspirin sold = $'
    brufen_print db 10,13, 'Brufen sold = $'
    cleritek_print db 10,13, 'Cleritek sold = $'
    paracetamol_print db 10,13, 'Paracetamol sold = $' 
    
    x dw ?
    y dw ?
    z dw ?
.code
main proc 
    mov ax,@data
    mov ds,ax
main endp

security proc
    
pass:    
    mov ah,9
    lea dx,input_password
    int 21h
    
    mov si,0 
    mov cx,6 
l1:
    mov ah,1
    int 21h
    cmp al,password[si]
    jne incorrect
    inc si
    loop l1
    call menu
incorrect:
    mov ah,9
    lea dx,incorrect_password
    int 21h
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,tryagain
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'1'
    mov ah,9
    lea dx,newLine
    int 21h
    je pass
    
    jmp exit
            
security endp

menu proc
     
showmenu:
    mov ah,9
    lea dx,welcome
    int 21h 
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,msg_medicines
    int 21h
    
    mov ah,9
    lea dx,medicines_sold
    int 21h
    
    mov ah,9
    lea dx,amount_print
    int 21h
    
    mov ah,9
    lea dx,exit_program
    int 21h
    
    mov ah,9
    lea dx,msg1
    int 21h 

    mov ah,1
    int 21h
    
    cmp al,'1'
    je buyMedicines 
    cmp al,'2'
    je statsMedicines
    cmp al,'3'
    je showAmount
    cmp al,'4'
    je exit
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,wrong_input
    int 21h
    
    mov ah,9
    lea dx,input_again
    int 21h
    jmp showmenu
    
menu endp

buyMedicines proc    
    lea dx,msg2
    mov ah,9
    int 21h
        
    lea dx,opt1
    mov ah,9
    int 21h
        
    lea dx,opt2
    mov ah,9
    int 21h
            
    lea dx,opt3
    mov ah,9
    int 21h
        
    lea dx,opt4
    mov ah,9
    int 21h
        
    lea dx,opt5
    mov ah,9
    int 21h
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'1'
    je panadol
    cmp al,'2'
    je paracetamol
    cmp al,'3'
    je cleritek
    cmp al,'4'
    je aspirin
    cmp al,'5'
    je brufen
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,wrong_input
    int 21h
    
    mov ah,9
    lea dx,input_again
    int 21h
    jmp showmenu
panadol:
    mov ah,9
    lea dx,msg_panadol
    int 21h
    call methodPanadol    
paracetamol:
    mov ah,9
    lea dx,msg_paracetamol
    int 21h
    call methodParacetamol
cleritek:
    mov ah,9
    lea dx,msg_paracetamol
    int 21h
    call methodParacetamol
aspirin:
    mov ah,9
    lea dx,msg_aspirin
    int 21h
    call methodAspirin
brufen:
    mov ah,9
    lea dx,msg_brufen
    int 21h
    call methodBrufen
                
buyMedicines endp

methodPanadol proc
    mov x,0
    mov y,0
    mov bx,10
inputPanadol:
    mov ah,1
    int 21h
    cmp al,13
    je calculatePanadol
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputPanadol
        

calculatePanadol:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_panadol  
    mov x,ax  
    add panadol_sold,ax
    add amount,ax
    call output
    jmp showmenu      
     
methodPanadol endp

methodParacetamol proc
    mov x,0
    mov y,0
    mov bx,10
inputParacetamol:
    mov ah,1
    int 21h
    cmp al,13
    je calculateParacetamol
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputParacetamol
        

calculateParacetamol:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_paracetamol  
    mov x,ax  
    add paracetamol_sold,ax
    add amount,ax 
    call output
    jmp showmenu     
     
methodParacetamol endp

methodCleritek proc
    mov x,0
    mov y,0
    mov bx,10
inputCleritek:
    mov ah,1
    int 21h
    cmp al,13
    je calculateCleritek
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputCleritek
        

calculateCleritek:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_cleritek  
    mov x,ax  
    add cleritek_sold,ax
    add amount,ax
    call output
    jmp showmenu     
     
methodCleritek endp

methodAspirin proc
    mov x,0
    mov y,0
    mov bx,10
inputAspirin:
    mov ah,1
    int 21h
    cmp al,13
    je calculateAspirin
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputAspirin
        

calculateAspirin:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_aspirin  
    mov x,ax  
    add aspirin_sold,ax
    add amount,ax 
    call output
    jmp showmenu      
     
methodAspirin endp

methodBrufen proc
    mov x,0
    mov y,0
    mov bx,10
inputBrufen:
    mov ah,1
    int 21h
    cmp al,13
    je calculateBrufen
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputBrufen
        

calculateBrufen:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_brufen  
    mov x,ax  
    call output
    jmp showmenu      
     
methodBrufen endp


statsMedicines proc
    mov ah,9
    lea dx,panadol_print
    int 21h
    mov ax,panadol_sold
    div price_panadol 
    mov x,ax
    call output
    
    mov ah,9
    lea dx,paracetamol_print
    int 21h
    mov ax,paracetamol_sold
    div price_paracetamol
    mov x,ax
    call output
    
    mov ah,9
    lea dx,cleritek_print
    int 21h
    mov ax,cleritek_sold
    div price_cleritek
    mov x,ax
    call output
    
    mov ah,9
    lea dx,aspirin_print
    int 21h
    mov ax,aspirin_sold
    div price_aspirin
    mov x,ax
    call output
    
    mov ah,9
    lea dx,brufen_print
    int 21h
    mov ax,brufen_sold
    div price_brufen
    mov x,ax
    call output 
    

statsMedicines endp

showAmount proc
    mov ax,amount
    mov x,ax    
    mov ah,9
    lea dx,amount_earned
    int 21h
    call output
    jmp showmenu    
showAmount endp

exit proc
    mov ah,4ch
    int 21h
exit endp

output proc
      mov bx,10
      mov ax,x
      mov cx,0
chia:
      mov dx,0
      div bx
      inc cx
      push dx 
      cmp al,0 
      je hienthi
      jmp chia 
hienthi:
      pop dx
      add dl,30h
      mov ah,2
      int 21h
      dec cx 
      cmp cx,0 
      jne hienthi 
      ret
output endp
END
