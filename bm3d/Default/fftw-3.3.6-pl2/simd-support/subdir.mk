################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../fftw-3.3.6-pl2/simd-support/altivec.o \
../fftw-3.3.6-pl2/simd-support/avx-128-fma.o \
../fftw-3.3.6-pl2/simd-support/avx.o \
../fftw-3.3.6-pl2/simd-support/avx2.o \
../fftw-3.3.6-pl2/simd-support/avx512.o \
../fftw-3.3.6-pl2/simd-support/kcvi.o \
../fftw-3.3.6-pl2/simd-support/libsimd_sse2_nonportable_la-sse2-nonportable.o \
../fftw-3.3.6-pl2/simd-support/neon.o \
../fftw-3.3.6-pl2/simd-support/sse2.o \
../fftw-3.3.6-pl2/simd-support/taint.o \
../fftw-3.3.6-pl2/simd-support/vsx.o 

C_SRCS += \
../fftw-3.3.6-pl2/simd-support/altivec.c \
../fftw-3.3.6-pl2/simd-support/avx-128-fma.c \
../fftw-3.3.6-pl2/simd-support/avx.c \
../fftw-3.3.6-pl2/simd-support/avx2.c \
../fftw-3.3.6-pl2/simd-support/avx512.c \
../fftw-3.3.6-pl2/simd-support/kcvi.c \
../fftw-3.3.6-pl2/simd-support/neon.c \
../fftw-3.3.6-pl2/simd-support/sse2-nonportable.c \
../fftw-3.3.6-pl2/simd-support/sse2.c \
../fftw-3.3.6-pl2/simd-support/taint.c \
../fftw-3.3.6-pl2/simd-support/vsx.c 

OBJS += \
./fftw-3.3.6-pl2/simd-support/altivec.o \
./fftw-3.3.6-pl2/simd-support/avx-128-fma.o \
./fftw-3.3.6-pl2/simd-support/avx.o \
./fftw-3.3.6-pl2/simd-support/avx2.o \
./fftw-3.3.6-pl2/simd-support/avx512.o \
./fftw-3.3.6-pl2/simd-support/kcvi.o \
./fftw-3.3.6-pl2/simd-support/neon.o \
./fftw-3.3.6-pl2/simd-support/sse2-nonportable.o \
./fftw-3.3.6-pl2/simd-support/sse2.o \
./fftw-3.3.6-pl2/simd-support/taint.o \
./fftw-3.3.6-pl2/simd-support/vsx.o 

C_DEPS += \
./fftw-3.3.6-pl2/simd-support/altivec.d \
./fftw-3.3.6-pl2/simd-support/avx-128-fma.d \
./fftw-3.3.6-pl2/simd-support/avx.d \
./fftw-3.3.6-pl2/simd-support/avx2.d \
./fftw-3.3.6-pl2/simd-support/avx512.d \
./fftw-3.3.6-pl2/simd-support/kcvi.d \
./fftw-3.3.6-pl2/simd-support/neon.d \
./fftw-3.3.6-pl2/simd-support/sse2-nonportable.d \
./fftw-3.3.6-pl2/simd-support/sse2.d \
./fftw-3.3.6-pl2/simd-support/taint.d \
./fftw-3.3.6-pl2/simd-support/vsx.d 


# Each subdirectory must supply rules for building sources it contributes
fftw-3.3.6-pl2/simd-support/%.o: ../fftw-3.3.6-pl2/simd-support/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


