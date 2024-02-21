.model small
.stack 
.data 
  message db 10, 13, 'Welcome to the program! $'
  first db 0
  second db 0
  message_equal db 10, 13, 'The numbers are equal $'
  message_first db 10, 13, 'First number is greather $'
  message_second db 10, 13, 'Second number is greather $'
  ask_first_input db 10, 13, 'Enter first number: $'
  ask_second_input db 10, 13, 'Enter second number: $'
.code
  start:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, message
    int 21h

    mov ah, 9
    lea dx, ask_first_input
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov first, al

    mov ah, 9
    lea dx, ask_second_input
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov second, al

    mov al, first
    cmp al, second

    jc greater_second
    jz equal
    jnz greater_first

  greater_first:
    mov ah, 9
    lea dx, message_first
    int 21h
    
    jmp exit

  greater_second:
    mov ah, 9
    lea dx, message_second
    int 21h

    jmp exit

  equal:
    mov ah, 9
    lea dx, message_equal
    int 21h

    jmp exit

  exit:
    mov ah, 4ch
    int 21h
end start
