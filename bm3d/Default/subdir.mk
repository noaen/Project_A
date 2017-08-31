################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../bm3d.o \
../io_png.o \
../lib_transforms.o \
../main.o \
../mt19937ar.o \
../utilities.o 

CPP_SRCS += \
../bm3d.cpp \
../lib_transforms.cpp \
../main.cpp \
../utilities.cpp 

C_SRCS += \
../io_png.c \
../mt19937ar.c 

OBJS += \
./bm3d.o \
./io_png.o \
./lib_transforms.o \
./main.o \
./mt19937ar.o \
./utilities.o 

C_DEPS += \
./io_png.d \
./mt19937ar.d 

CPP_DEPS += \
./bm3d.d \
./lib_transforms.d \
./main.d \
./utilities.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


