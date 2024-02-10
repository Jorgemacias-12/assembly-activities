; ---------------------------------------------------------
; Programa: calculator.asm
; Autor: Jorge Macias
; Descripci??n: Two number calculator in 16-bit DOS assembly.
;              Example of a program that displays
;              the message "Hello world!" on screen.
; ---------------------------------------------------------
.model small
.stack 100h
.data
  menu_message db 'Choose an option:', 0ah, '1. Add', 0ah, '2. Subtract', 0ah, '3. Multiply', 0ah, '4. Divide', 0ah, '5. Exit', 0ah, '$'
  
  first_number db 0
  second_number db 0
  result db 0
  
  message_first_number db 10, 13, 'Enter first number: $'
  message_second_number db 10, 13, 'Enter second number: $'
  message_result db 10, 13, 'Result is: $'

  invalid_choice db 10, 13, 'Invalid option! choose another'

  menu_option db ?
.code
  start:

    ; Code section begins here

    ; To understand syscalls and services to achieve stuff 
    ; you can read it here: https://en.wikipedia.org/wiki/DOS_API#DOS_INT_21h_services

    ; Configure data segments
    mov ax, @data
    mov ds, ax
    
    ; Print menu to the screen
    mov ah, 9
    lea dx, menu_message
    int 21h

    ; Menu option input
    mov ah, 1  ; Character input to the ah register
    int 21h    ; Make the DOS syscall
    sub al, '0'
    mov menu_option, al

    ; Go to a different operation depending of the integer selected
    ; use cmp -> compare to make an 'if' statement
    cmp menu_option, 1
    je sum

    cmp menu_option, 2
    je res
    
    cmp menu_option, 3
    je mult
  
    cmp menu_option, 4
    je divi

    jmp invalid_option
  sum: 
    mov ah, 9
    lea dx, message_first_number
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h
    mov first_number, al

    mov ah, 9
    lea dx, message_second_number
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h
    mov second_number, al

    mov al, first_number
    add al, second_number
    add al, 30h
    mov result, al

    mov ah, 9 
    lea dx, message_result
    int 21h

    mov ah, 2
    mov dl, result
    int 21h

    jmp exit
  
  res:
    mov ah, 9
    lea dx, message_first_number
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h
    mov first_number, al

    mov ah, 9
    lea dx, message_second_number
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h
    mov second_number, al

    mov al, first_number
    mov bl, second_number

    mov al, first_number
    sub al, second_number
    add al, 30h
    mov result, al

    mov ah, 9 
    lea dx, message_result
    int 21h

    mov ah, 2
    mov dl, result
    int 21h

    jmp exit

mult:
  mov ah, 9
  lea dx, message_first_number
  int 21h

  mov ah, 1
  int 21h
  sub al, 30h
  mov first_number, al

  mov ah, 9
  lea dx, message_second_number
  int 21h

  mov ah, 1
  int 21h
  sub al, 30h
  mov second_number, al
    
  mov al, first_number
  mul al, second_number
  add al, 30h
  mov result, al

  mov ah, 9 
  lea dx, message_result
  int 21h

  mov ah, 2
  mov dl, result
  int 21h

  jmp start

divi:
  mov ah, 9
  lea dx, message_first_number
  int 21h

  mov ah, 1
  int 21h
  sub al, 30h
  mov first_number, al

  mov ah, 9
  lea dx, message_second_number
  int 21h

  mov ah, 1
  int 21h
  sub al, 30h
  mov second_number, al

  mov al, first_number
  div al, second_number
  add al, 30h
  mov result, al

  mov ah, 9 
  lea dx, message_result
  int 21h

  mov ah, 2
  mov dl, result
  int 21h

  invalid_option:
    mov ah, 9
    lea dx, invalid_choice
    int 21h

    jmp exit  

  ; Exit from the program
  exit:
    mov ah, 4ch ; Function to finish the program
    int 21h     ; Make DOS syscall
  end start