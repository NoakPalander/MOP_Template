CC_PATH := /usr/share/codelite/tools/gcc-arm

CC := $(CC_PATH)/bin/arm-none-eabi-gcc
CXX := $(CC_PATH)/bin/arm-none-eabi-g++
CC_FLAGS := -Wall -Wextra -Wpedantic -Wconversion -std=c11 \
	-mthumb -march=armv6-m -mno-unaligned-access -mfloat-abi=soft

CXX_FLAGS := -L. *.o -lgcc -lc_nano -Tmd407-ram.x -nostartfiles

CXX_INC := \
	-L $(CC_PATH)/arm-none-eabi/include/c++/9.2.1/arm-none-eabi/thumb/v6-m/nofp \
	-L $(CC_PATH)/arm-none-eabi/lib/thumb/nofp

OBJCPY := $(CC_PATH)/bin/arm-none-eabi-objcopy
OBJDMP := $(CC_PATH)/bin/arm-none-eabi-objdump

FILES := \
	src/main.c

build:
	-mkdir debug
	$(CC) -c $(FILES) $(CC_FLAGS) -g -O0
	$(CXX) -o debug/MOP $(CXX_FLAGS) $(CXX_INC)
	$(OBJCPY) -S -O srec debug/MOP debug/MOP.s19
	$(OBJDMP) -D -S debug/MOP > debug/MOP.dass
	-mv *.o debug   # Unix

build-release:
	-mkdir release
	$(CC) -c $(FILES) $(CC_FLAGS) -g -Os
	$(CXX) -o debug/MOP $(CXX_FLAGS) $(CXX_INC)
	$(OBJCPY) -S -O srec release/MOP release/MOP.s19
	$(OBJDMP) -D -S release/MOP > release/MOP.dass
	-mv *.o release   # Unix

clean:
	rm -r debug
