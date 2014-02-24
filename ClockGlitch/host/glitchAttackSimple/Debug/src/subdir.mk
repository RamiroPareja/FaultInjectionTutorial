################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/board_nxp_xpresso_1769.c \
../src/clock_17xx_40xx.c \
../src/cr_startup_lpc175x_6x.c \
../src/main.c \
../src/sysctl_17xx_40xx.c \
../src/sysinit_nxp_xpresso_1769.c 

OBJS += \
./src/board_nxp_xpresso_1769.o \
./src/clock_17xx_40xx.o \
./src/cr_startup_lpc175x_6x.o \
./src/main.o \
./src/sysctl_17xx_40xx.o \
./src/sysinit_nxp_xpresso_1769.o 

C_DEPS += \
./src/board_nxp_xpresso_1769.d \
./src/clock_17xx_40xx.d \
./src/cr_startup_lpc175x_6x.d \
./src/main.d \
./src/sysctl_17xx_40xx.d \
./src/sysinit_nxp_xpresso_1769.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -DCORE_M3 -D__LPC17XX__ -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_chip/chip_17xx_40xx/ -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_chip/chip_common -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_ip -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_board/board_common -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_board/boards_17xx_40xx/nxp_xpresso_1769 -I/home/tato/code/ARM/lpcopen-1.03/software/CMSIS/CMSIS/Include -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/cr_startup_lpc175x_6x.o: ../src/cr_startup_lpc175x_6x.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -DCORE_M3 -D__LPC17XX__ -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_chip/chip_17xx_40xx/ -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_chip/chip_common -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_ip -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_board/board_common -I/home/tato/code/ARM/lpcopen-1.03/software/lpc_core/lpc_board/boards_17xx_40xx/nxp_xpresso_1769 -I/home/tato/code/ARM/lpcopen-1.03/software/CMSIS/CMSIS/Include -Os -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/cr_startup_lpc175x_6x.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


