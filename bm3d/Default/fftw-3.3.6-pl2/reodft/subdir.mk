################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/reodft/conf.o \
../fftw-3.3.6-pl2/reodft/redft00e-r2hc-pad.o \
../fftw-3.3.6-pl2/reodft/reodft00e-splitradix.o \
../fftw-3.3.6-pl2/reodft/reodft010e-r2hc.o \
../fftw-3.3.6-pl2/reodft/reodft11e-r2hc-odd.o \
../fftw-3.3.6-pl2/reodft/reodft11e-radix2.o \
../fftw-3.3.6-pl2/reodft/rodft00e-r2hc-pad.o 

C_SRCS += \
../fftw-3.3.6-pl2/reodft/conf.c \
../fftw-3.3.6-pl2/reodft/redft00e-r2hc-pad.c \
../fftw-3.3.6-pl2/reodft/redft00e-r2hc.c \
../fftw-3.3.6-pl2/reodft/reodft00e-splitradix.c \
../fftw-3.3.6-pl2/reodft/reodft010e-r2hc.c \
../fftw-3.3.6-pl2/reodft/reodft11e-r2hc-odd.c \
../fftw-3.3.6-pl2/reodft/reodft11e-r2hc.c \
../fftw-3.3.6-pl2/reodft/reodft11e-radix2.c \
../fftw-3.3.6-pl2/reodft/rodft00e-r2hc-pad.c \
../fftw-3.3.6-pl2/reodft/rodft00e-r2hc.c 

OBJS += \
./fftw-3.3.6-pl2/reodft/conf.o \
./fftw-3.3.6-pl2/reodft/redft00e-r2hc-pad.o \
./fftw-3.3.6-pl2/reodft/redft00e-r2hc.o \
./fftw-3.3.6-pl2/reodft/reodft00e-splitradix.o \
./fftw-3.3.6-pl2/reodft/reodft010e-r2hc.o \
./fftw-3.3.6-pl2/reodft/reodft11e-r2hc-odd.o \
./fftw-3.3.6-pl2/reodft/reodft11e-r2hc.o \
./fftw-3.3.6-pl2/reodft/reodft11e-radix2.o \
./fftw-3.3.6-pl2/reodft/rodft00e-r2hc-pad.o \
./fftw-3.3.6-pl2/reodft/rodft00e-r2hc.o 

C_DEPS += \
./fftw-3.3.6-pl2/reodft/conf.d \
./fftw-3.3.6-pl2/reodft/redft00e-r2hc-pad.d \
./fftw-3.3.6-pl2/reodft/redft00e-r2hc.d \
./fftw-3.3.6-pl2/reodft/reodft00e-splitradix.d \
./fftw-3.3.6-pl2/reodft/reodft010e-r2hc.d \
./fftw-3.3.6-pl2/reodft/reodft11e-r2hc-odd.d \
./fftw-3.3.6-pl2/reodft/reodft11e-r2hc.d \
./fftw-3.3.6-pl2/reodft/reodft11e-radix2.d \
./fftw-3.3.6-pl2/reodft/rodft00e-r2hc-pad.d \
./fftw-3.3.6-pl2/reodft/rodft00e-r2hc.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/reodft/%.o: ../fftw-3.3.6-pl2/reodft/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


