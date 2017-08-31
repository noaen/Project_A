################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../fftw-3.3.6-pl2/support/addchain.c 

OBJS += \
./fftw-3.3.6-pl2/support/addchain.o 

C_DEPS += \
./fftw-3.3.6-pl2/support/addchain.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/support/%.o: ../fftw-3.3.6-pl2/support/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


