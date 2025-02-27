PYCC = cython
CC = gcc
CFLAGS = -O3 -Wall -shared -std=c99 -fPIC -fopenmp
PYCCSRC = sdk/MCOLibrarySdk.pyx
PYCCOBJ = sdk/MCOLibrarySdk.c
PYCCOBJO = sdk/MCOLibrarySdk.o
PYCCOBJSO = sdk/MCOLibrarySdk.so
MAIN = src/main.c, src/main.h, src/Asm.c, src/Firmware.c
MAINOBJ = src/main.o

all: $(PYCCOBJSO) $(MAINOBJ)
	$(CC) $(CFLAGS) $(MAIN) $(MAINOBJ) $(PYCCOBJSO) -o mpc_boot

$(PYCCOBJSO): $(PYCCOBJO)
	$(CC) $(CFLAGS) -o $(PYCCOBJSO) $(PYCCOBJO)

install-lib:
	cp -r sdk/MCOLibrarySdk.so /usr/local/lib/python3.6/dist-packages/

install-deps:
	python3 -m pip install --upgrade pip
	python3 -m pip install -r requirements.txt

make-system:
	if [ -f /usr/local/bin/mkroot ]; then echo "mkroot is installed"; else echo "mkroot is not installed"; fi
	mkroot -v
	mkroot -F ./rooter/rootfile.sh -C "as ux" -I/usr/local/include/mpc/MCOLibrarySdk.so -o build/rootfs
	tar build/rootfs -c -f build/rootfs.tar
	rm -rf build/rootfs
	@echo "MCO Unix Rootfs created"

clean:
	rm -f $(PYCCOBJ) $(PYCCOBJO) $(PYCCOBJSO) $(MAINOBJ) mpc_boot
	rm -rf build