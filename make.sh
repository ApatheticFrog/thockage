#!/bin/bash
cd thockage


CFLAGS=`python3-config --embed --includes`


# .pyx -> .c
cython keyboard_control.pyx
cython audio.pyx
cython config.pyx
cython definitions.pyx


# .c -> .o
gcc -g -O2 -fpic `python-config --cflags` -c keyboard_control.c -o keyboard_control.o
gcc -g -O2 -fpic `python-config --cflags` -c audio.c -o audio.o
gcc -g -O2 -fpic `python-config --cflags` -c config.c -o config.o
gcc -g -O2 -fpic `python-config --cflags` -c definitions.c -o definitions.o


#.o -> .so
LDFLAGS=$(python-config --ldflags)
gcc keyboard_control.o -o ./keyboard_control.so -shared ${LDFLAGS}
gcc audio.o -o ./audio.so -shared ${LDFLAGS}
gcc config.o -o ./config.so -shared ${LDFLAGS}
gcc definitions.o -o ./definitions.so -shared ${LDFLAGS}


# Cleanup
rm keyboard_control.c
rm keyboard_control.o
rm audio.c
rm audio.o
rm config.c
rm config.o
rm definitions.c
rm definitions.o