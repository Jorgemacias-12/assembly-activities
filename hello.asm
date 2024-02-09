; ---------------------------------------------------------
; Programa: hello.asm
; Autor: Jorge Macias
; Descripci?n: Hola mundo en DOS assembly de 16 bits.
;              Ejemplo b?sico de un programa que muestra
;              el mensaje "Hello world!" en pantalla.
; ---------------------------------------------------------


; Defines the memory model and stack size
.model small
.stack
.data ; Data section (put variables here)
    
    ; Defines the hello world string with carriage return and line feed at the end
    hello db 10, 13, 'Hello world! $'
.code
start:
    
    ; code section begins here
    
    ; To understand syscalls and which one use to achieve something
    ; see this link: https://en.wikipedia.org/wiki/DOS_API#DOS_INT_21h_services

    ; Configure data segments
    mov ax, @data
    mov ds, ax
    
    ; Show the message to the screen
    mov ah, 9 ; function to print the string to the screen
    lea dx, hello ; load the direction of the address into the dx register
    int 21h ; Make the DOS syscall (again see https://en.wikipedia.org/wiki/DOS_API#DOS_INT_21h_services) for more details
    
    ; Exit from the program
    mov ah, 4ch ; function to finish the program
    int 21h ; Make the DOS syscall
end start