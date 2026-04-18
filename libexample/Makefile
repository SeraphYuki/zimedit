# linux
CC=gcc
EXECUTABLE=zim
CFLAGS =   $(shell pkg-config --cflags sdl2) $(shell pkg-config --cflags freetype2)
FREETYPELIBS = $(shell pkg-config --libs freetype2)
GLEWLIBS = $(shell pkg-config  --libs glew)
SDLLIBS = $(shell pkg-config --libs sdl2)
LDLIBS = -L. -lthoth $(GLEWLIBS) $(SDLLIBS) $(FREETYPELIBS) 

SOURCES=main.c window.c log.c

OBJECTS=$(SOURCES:.c=.o)

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) $(LDLIBS) -o $@

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm *.o
