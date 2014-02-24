;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                          ;;;
;;                          CLOCK GLITCHING TUTORIAL                          ;;
;;                               Simple Example                               ;;
;;;                                                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                          ;;;
;;    Author: Ramiro Pareja - www.t4f.org        feb/2014                     ;;
;;                                                                            ;;
;;    Description: This source is a test application to experiment with       ;;
;;                 clock glitching.                                           ;;
;;                 It puts the PIC in an infinite loop. If the glitching is   ;;
;;                 successful,the loop is broken and a led will lit.          ;;
;;;                                                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



    __CONFIG _CONFIG1, _FOSC_EC & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_ON & _CPD_OFF & _WRT_OFF & _CCPMX_RB0 & _CP_OFF
    __CONFIG _CONFIG2, _FCMEN_OFF & _IESO_OFF


#include "p16f88.inc"


#DEFINE LED1 PORTA, RA2         ; This LED is on during the infinite loop 1
#DEFINE LED1_TRIS TRISA, RA2
#DEFINE LED2 PORTA, RA3         ; This LED is on during the infinite loop 2
#DEFINE LED2_TRIS TRISA, RA3    


    CODE    0X00

INIT:

    CLRF    PORTA               ; Set the IOs as digital and LED/LED2 as outputs

    BANKSEL ANSEL
    CLRF    ANSEL
    BCF     LED1_TRIS
    BCF     LED2_TRIS

    BANKSEL PORTA



START:

    BSF     LED1                ; LED1 on and LED2 off
    BCF     LED2

INFINITE_LOOP1:

    GOTO    INFINITE_LOOP1      ; Infinite loop. Exits only if glitching works
    
    BCF     LED1                ; LED1 off and LED2 on
    BSF     LED2
   
    
INFINITE_LOOP2:

    GOTO    INFINITE_LOOP2      ; Infinite loop. Exits only if glitching works

    GOTO    START

    END

