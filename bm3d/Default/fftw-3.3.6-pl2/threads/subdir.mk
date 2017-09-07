################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../fftw-3.3.6-pl2/threads/api.c \
../fftw-3.3.6-pl2/threads/conf.c \
../fftw-3.3.6-pl2/threads/ct.c \
../fftw-3.3.6-pl2/threads/dft-vrank-geq1.c \
../fftw-3.3.6-pl2/threads/f77api.c \
../fftw-3.3.6-pl2/threads/hc2hc.c \
../fftw-3.3.6-pl2/threads/openmp.c \
../fftw-3.3.6-pl2/threads/rdft-vrank-geq1.c \
../fftw-3.3.6-pl2/threads/threads.c \
../fftw-3.3.6-pl2/threads/vrank-geq1-rdft2.c 

OBJS += \
./fftw-3.3.6-pl2/threads/api.o \
./fftw-3.3.6-pl2/threads/conf.o \
./fftw-3.3.6-pl2/threads/ct.o \
./fftw-3.3.6-pl2/threads/dft-vrank-geq1.o \
./fftw-3.3.6-pl2/threads/f77api.o \
./fftw-3.3.6-pl2/threads/hc2hc.o \
./fftw-3.3.6-pl2/threads/openmp.o \
./fftw-3.3.6-pl2/threads/rdft-vrank-geq1.o \
./fftw-3.3.6-pl2/threads/threads.o \
./fftw-3.3.6-pl2/threads/vrank-geq1-rdft2.o 

C_DEPS += \
./fftw-3.3.6-pl2/threads/api.d \
./fftw-3.3.6-pl2/threads/conf.d \
./fftw-3.3.6-pl2/threads/ct.d \
./fftw-3.3.6-pl2/threads/dft-vrank-geq1.d \
./fftw-3.3.6-pl2/threads/f77api.d \
./fftw-3.3.6-pl2/threads/hc2hc.d \
./fftw-3.3.6-pl2/threads/openmp.d \
./fftw-3.3.6-pl2/threads/rdft-vrank-geq1.d \
./fftw-3.3.6-pl2/threads/threads.d \
./fftw-3.3.6-pl2/threads/vrank-geq1-rdft2.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/threads/%.o: ../fftw-3.3.6-pl2/threads/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


