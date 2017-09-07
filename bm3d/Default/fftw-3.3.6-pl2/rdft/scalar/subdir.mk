################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/rdft/scalar/hc2c.o \
../fftw-3.3.6-pl2/rdft/scalar/hfb.o \
../fftw-3.3.6-pl2/rdft/scalar/r2c.o \
../fftw-3.3.6-pl2/rdft/scalar/r2r.o 

C_SRCS += \
../fftw-3.3.6-pl2/rdft/scalar/hc2c.c \
../fftw-3.3.6-pl2/rdft/scalar/hfb.c \
../fftw-3.3.6-pl2/rdft/scalar/r2c.c \
../fftw-3.3.6-pl2/rdft/scalar/r2r.c 

OBJS += \
./fftw-3.3.6-pl2/rdft/scalar/hc2c.o \
./fftw-3.3.6-pl2/rdft/scalar/hfb.o \
./fftw-3.3.6-pl2/rdft/scalar/r2c.o \
./fftw-3.3.6-pl2/rdft/scalar/r2r.o 

C_DEPS += \
./fftw-3.3.6-pl2/rdft/scalar/hc2c.d \
./fftw-3.3.6-pl2/rdft/scalar/hfb.d \
./fftw-3.3.6-pl2/rdft/scalar/r2c.d \
./fftw-3.3.6-pl2/rdft/scalar/r2r.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/rdft/scalar/%.o: ../fftw-3.3.6-pl2/rdft/scalar/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


