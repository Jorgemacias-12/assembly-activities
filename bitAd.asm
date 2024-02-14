; Program: bitadjust.asm
; Authors: Jorge Macias
;          Diego Cervantes
;          Christian Alvarez
;
; Description: An example program that uses and shows the concept of 
;              adjustment and carriage in math operations.
.model small
.stack
.data ; Data section (put variables here)
    first_number dw 0
    second_number dw 0 

    result dw ?
    carriage db ?

    welcome_message db 10, 13, 'Welcome! adjustment and carriage program example $'
    
    message_first_input db 10, 13, 'Enter first number: $'
    message_second_input db 10, 13, 'Enter second number: $'

    buffer db 6 dup (?)
.code
start:
    
    ; code section begins here
    
    ; To understand syscalls and which one use to achieve something
    ; see this link: https://en.wikipedia.org/wiki/DOS_API#DOS_INT_21h_services

    ; Configure data segments
    mov ax, @data
    mov ds, ax
    
    ; Print welcome message
    mov ah, 9
    lea dx, welcome_message 
    int 21h
    
    ; Print input message #1
    mov ah, 9
    lea dx, message_first_input
    int 21h

    ; Ask for input #1
    mov ah, 1
    int 21h
    sub al, 30h
    mov first_number, al

    ; Print input message #2
    mov ah, 9
    lea dx, message_second_input
    int 21h

    ; Ask for input #2
    mov ah, 1
    int 21h
    sub al, 30h
    mov second_number, al
    
    ; Exit from the program
    mov ah, 4ch ; function to finish the program
    int 21h ; Make the DOS syscall
end start
  