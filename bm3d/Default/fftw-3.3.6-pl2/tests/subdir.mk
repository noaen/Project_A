################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/tests/bench-bench.o \
../fftw-3.3.6-pl2/tests/bench-fftw-bench.o \
../fftw-3.3.6-pl2/tests/bench-hook.o 

C_SRCS += \
../fftw-3.3.6-pl2/tests/bench.c \
../fftw-3.3.6-pl2/tests/fftw-bench.c \
../fftw-3.3.6-pl2/tests/hook.c 

OBJS += \
./fftw-3.3.6-pl2/tests/bench.o \
./fftw-3.3.6-pl2/tests/fftw-bench.o \
./fftw-3.3.6-pl2/tests/hook.o 

C_DEPS += \
./fftw-3.3.6-pl2/tests/bench.d \
./fftw-3.3.6-pl2/tests/fftw-bench.d \
./fftw-3.3.6-pl2/tests/hook.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/tests/%.o: ../fftw-3.3.6-pl2/tests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


