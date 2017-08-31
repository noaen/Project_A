################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/rdft/scalar/r2r/codlist.o \
../fftw-3.3.6-pl2/rdft/scalar/r2r/e01_8.o \
../fftw-3.3.6-pl2/rdft/scalar/r2r/e10_8.o 

C_SRCS += \
../fftw-3.3.6-pl2/rdft/scalar/r2r/codlist.c \
../fftw-3.3.6-pl2/rdft/scalar/r2r/e01_8.c \
../fftw-3.3.6-pl2/rdft/scalar/r2r/e10_8.c 

OBJS += \
./fftw-3.3.6-pl2/rdft/scalar/r2r/codlist.o \
./fftw-3.3.6-pl2/rdft/scalar/r2r/e01_8.o \
./fftw-3.3.6-pl2/rdft/scalar/r2r/e10_8.o 

C_DEPS += \
./fftw-3.3.6-pl2/rdft/scalar/r2r/codlist.d \
./fftw-3.3.6-pl2/rdft/scalar/r2r/e01_8.d \
./fftw-3.3.6-pl2/rdft/scalar/r2r/e10_8.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/rdft/scalar/r2r/%.o: ../fftw-3.3.6-pl2/rdft/scalar/r2r/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


