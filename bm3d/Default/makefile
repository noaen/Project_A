################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm

# All of the sources participating in the build are defined here
-include sources.mk
-include fftw-3.3.6-pl2/tools/subdir.mk
-include fftw-3.3.6-pl2/threads/subdir.mk
-include fftw-3.3.6-pl2/tests/subdir.mk
-include fftw-3.3.6-pl2/support/subdir.mk
-include fftw-3.3.6-pl2/simd-support/subdir.mk
-include fftw-3.3.6-pl2/reodft/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/vsx/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/sse2/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/neon/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/kcvi/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/generic-simd256/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/generic-simd128/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/common/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/avx512/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/avx2-128/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/avx2/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/avx-128-fma/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/avx/subdir.mk
-include fftw-3.3.6-pl2/rdft/simd/altivec/subdir.mk
-include fftw-3.3.6-pl2/rdft/scalar/r2r/subdir.mk
-include fftw-3.3.6-pl2/rdft/scalar/r2cf/subdir.mk
-include fftw-3.3.6-pl2/rdft/scalar/r2cb/subdir.mk
-include fftw-3.3.6-pl2/rdft/scalar/subdir.mk
-include fftw-3.3.6-pl2/rdft/subdir.mk
-include fftw-3.3.6-pl2/mpi/subdir.mk
-include fftw-3.3.6-pl2/libbench2/subdir.mk
-include fftw-3.3.6-pl2/kernel/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/vsx/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/sse2/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/neon/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/kcvi/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/generic-simd256/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/generic-simd128/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/common/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/avx512/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/avx2-128/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/avx2/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/avx-128-fma/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/avx/subdir.mk
-include fftw-3.3.6-pl2/dft/simd/altivec/subdir.mk
-include fftw-3.3.6-pl2/dft/scalar/codelets/subdir.mk
-include fftw-3.3.6-pl2/dft/scalar/subdir.mk
-include fftw-3.3.6-pl2/dft/subdir.mk
-include fftw-3.3.6-pl2/api/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: bm3d_tweak

# Tool invocations
bm3d_tweak: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++  -o "bm3d_tweak" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(C++_DEPS)$(OBJS)$(C_DEPS)$(CC_DEPS)$(CPP_DEPS)$(EXECUTABLES)$(CXX_DEPS)$(C_UPPER_DEPS) bm3d_tweak
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
