;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                          ;;;
;;                          CLOCK GLITCHING TUTORIAL                          ;;
;;                       Reset synchronization example                        ;;
;;;                                                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                          ;;;
;;    Author: Ramiro Pareja - www.t4f.org        feb/2014                     ;;
;;                                                                            ;;
;;    Description: This source is a test application to experiment with       ;;
;;                 clock glitching.                                           ;;
;;                 It puts the PIC in an infinite loop once it checks no      ;;
;;                 more PIN tries are left.                                   ;;
;;                 The clock glitching attack is syncronized with the reset   ;;
;;                 signal.                                                    ;;
;;                                                                            ;;
;;                 Most of the functions are not implemented and return       ;;
;;                 values are hard-coded.                                     ;;
;;;                                                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


 __CONFIG _CONFIG1, _FOSC_EC & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_ON & _CPD_OFF & _WRT_OFF & _CCPMX_RB0 & _CP_OFF
 __CONFIG _CONFIG2, _FCMEN_OFF & _IESO_OFF


#include "p16f88.inc"


#DEFINE LED1 PORTA, RA2         ; This LED is on during the infinite loop
#DEFINE LED1_TRIS TRISA, RA2
#DEFINE LED2 PORTA, RA3         ; This LED is on if the glitching break the loop
#DEFINE LED2_TRIS TRISA, RA3    

    UDATA


    CODE    0x00

INIT:

    CLRF    PORTA               ; Set the IOs as digital and LED/LED2 as outputs
                                
    BANKSEL ANSEL
    CLRF    ANSEL
    BCF     LED1_TRIS
    BCF     LED2_TRIS

    BANKSEL PORTA



START:

    CALL    GET_PIN_TRIES       ; Checks if there are more PIN tries left
    ANDLW   0xFF
    BTFSC   STATUS, Z           
    GOTO    GO_SLEEP            ; 0 tries left. Go to sleep

    BSF     LED1                ; Still some tries left.

    ; ...
    ; Here, the PIN check and the rest of the application should be implemented 
    ;

END_LOOP:
    GOTO    END_LOOP

GO_SLEEP:

    BSF     LED2                ; Going to sleep
    SLEEP

    GOTO    GO_SLEEP          ; Just in case it wakes up from the sleep





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                          ;;;
;;      Function: GET_PIN_TRIES                                               ;;
;;      Input:                                                                ;;
;;      Output: W -> Number of PIN tries left                                 ;;
;;      Description: Returns the number of PIN tries left stored in EEPROM.   ;;
;;                                                                            ;;
;;      NOTE: Not currently implemented. Returns a hard-coded value.          ;;
;;;                                                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GET_PIN_TRIES:

    ; TO IMPLEMENT

    RETLW   0                   ; 0 tries left (hard-coded)

    END

