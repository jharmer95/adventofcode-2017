
all: advent1.run

advent1.run: advent1.o
	aarch64-linux-gnu-gcc -static -o advent1.run advent1.o

advent1.o: advent1.s
	aarch64-linux-gnu-as -c advent1.s -o advent1.o

run: advent1.run
	@/bin/bash -c 'qemu-aarch64 ./advent1.run $(ARGS); echo "Code returned: $$?"'
