################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/tools/fftw_wisdom-fftw-wisdom.o 

C_SRCS += \
../fftw-3.3.6-pl2/tools/fftw-wisdom.c 

OBJS += \
./fftw-3.3.6-pl2/tools/fftw-wisdom.o 

C_DEPS += \
./fftw-3.3.6-pl2/tools/fftw-wisdom.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/tools/%.o: ../fftw-3.3.6-pl2/tools/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


