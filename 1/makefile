
all: advent1_1.run advent1_2.run

advent1_1.run: advent1_1.o
	aarch64-linux-gnu-gcc -static -o advent1_1.run advent1_1.o

advent1_1.o: advent1_1.s
	aarch64-linux-gnu-as -c advent1_1.s -o advent1_1.o

run1: advent1_1.run
	@/bin/bash -c 'qemu-aarch64 ./advent1_1.run $(ARGS);'

advent1_2.run: advent1_2.o
	aarch64-linux-gnu-gcc -static -o advent1_2.run advent1_2.o

advent1_2.o: advent1_2.s
	aarch64-linux-gnu-as -c advent1_2.s -o advent1_2.o

run2: advent1_2.run
	@/bin/bash -c 'qemu-aarch64 ./advent1_2.run $(ARGS);'
