################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/%.o Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/%.su Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/%.cyclo: ../Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/%.c Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"/media/pranab/INFO/0.Ubuntu_Downloads/RTOS/2024/RTOS-workspace/Demo-2/Third-Party/FreeRTOS" -I"/media/pranab/INFO/0.Ubuntu_Downloads/RTOS/2024/RTOS-workspace/Demo-2/Third-Party/FreeRTOS/include" -I"/media/pranab/INFO/0.Ubuntu_Downloads/RTOS/2024/RTOS-workspace/Demo-2/Third-Party/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third-2d-Party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

clean-Third-2d-Party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.cyclo ./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.d ./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.o ./Third-Party/FreeRTOS/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-Third-2d-Party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

