# Mercat V0.2 (Posix)
# (C) 1997-8 David Given

# Remember to change config.h!

# The one thing I can't autodetect in globals.h is whether to link the curses
# library or not. If you need the ncurses library, i.e. if you're on Unix,
# uncomment this.

#LIBS = -lncurses

VERSION = \"Mercat V0.3 runtime (Posix)\"
CFLAGS = -g -O6 -Wall
EXE = mi

OBJS =	alloc.o			\
	avltree.o		\
	disasm.o		\
	interp.o		\
	main.o			\
	misc.o			\
	object.o		\
	stack.o			\
	syscall/app.o		\
	syscall/convert.o	\
	syscall/debug.o		\
	syscall/number.o	\
	syscall/streamio.o	\
	syscall/stringop.o	\
	syscall/scr.o		\
	syscall/time.o		\
	syscall/internet.o	\
	syscalls.o

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) -o $(EXE) $(OBJS) $(LIBS)

clean:
	$(RM) $(OBJS) $(EXE)
	
%.o: %.c
	$(CC) -c -o $@ $(CFLAGS) -I. -DMERCAT_VERSION="$(VERSION)" $<
	
misc.c: inline.h

syscall/scr.o: syscall/scr/msdos.h syscall/scr/unix.h
syscall/internet.o: syscall/internet/unix.h

