################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LibROV3/Algorithm.c \
../LibROV3/BasicCtrl.c \
../LibROV3/Display.c \
../LibROV3/Sensor.c 

OBJS += \
./LibROV3/Algorithm.o \
./LibROV3/BasicCtrl.o \
./LibROV3/Display.o \
./LibROV3/Sensor.o 

C_DEPS += \
./LibROV3/Algorithm.d \
./LibROV3/BasicCtrl.d \
./LibROV3/Display.d \
./LibROV3/Sensor.d 


# Each subdirectory must supply rules for building sources it contributes
LibROV3/Algorithm.o: ../LibROV3/Algorithm.c LibROV3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H750xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"F:/Git_repository/OurEDA/OurEDA-B2S/Software/OurEDA-B2S_CtrlH7/LibROV3" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"LibROV3/Algorithm.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
LibROV3/BasicCtrl.o: ../LibROV3/BasicCtrl.c LibROV3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H750xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"F:/Git_repository/OurEDA/OurEDA-B2S/Software/OurEDA-B2S_CtrlH7/LibROV3" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"LibROV3/BasicCtrl.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
LibROV3/Display.o: ../LibROV3/Display.c LibROV3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H750xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"F:/Git_repository/OurEDA/OurEDA-B2S/Software/OurEDA-B2S_CtrlH7/LibROV3" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"LibROV3/Display.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
LibROV3/Sensor.o: ../LibROV3/Sensor.c LibROV3/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H750xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"F:/Git_repository/OurEDA/OurEDA-B2S/Software/OurEDA-B2S_CtrlH7/LibROV3" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"LibROV3/Sensor.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

