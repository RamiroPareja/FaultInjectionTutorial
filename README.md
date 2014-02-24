FAULT INJECTION TUTORIAL 
Ramiro Pareja  - feb/2014

This is the source code of the fault injection tutorial I wrote. You can read the tutorial here:

http://www.t4f.org/articles/fault-injection-attacks-clock-glitching-tutorial


The 'host' firmware runs on a LPCXpresso board for ARM LPC1769 and the 'target' runs on a PIC 16F88. 
To compile the projects you will need the LPCXpresso 6 and the MPLABX 1.20.

Directories:

\host: firmware for the host system that executes the attack
   \glitchAttackSimple: Simple example attack
   \glitchAttackReset: Attack synchronized with the reset signal

\target: firmware to run in the target system
   \glitchTutorialSimple.X: Simple example attack
   \glitchTutorialReset.X: Attack synchronized with the reset signal


