### wish i knew make, uncomment for library compile comment everything else
#CC=gcc
#EXECUTABLE=libthoth.a
#CFLAGS = -g -Wall -lm  -DSDL2_COMPILE -DSDL_COMPILE -DLIBRARY_COMPILE -DLINUX_COMPILE\
#$(shell pkg-config --cflags sdl2) $(shell pkg-config --cflags freetype2)
#
#SOURCES=main.c text_editor.c window.c graphics.c log.c freetype.c file_browser.c config.c json.c
#OBJECTS=$(SOURCES:.c=.o)
#
#
#all: $(SOURCES) $(EXECUTABLE)
#
#$(EXECUTABLE): $(OBJECTS) 
#	ar -rc $@ $(OBJECTS)
#
#.c.o:
#	$(CC) -c $(CFLAGS) $< -o $@
#
#clean:
#	rm *.o

#
# # linux / BSD
#CC=gcc
#EXECUTABLE=zim
#
#CFLAGS = -g -Wall -lm -DLINUX_COMPILE -DSDL_COMPILE -DSDL3_COMPILE  $(shell pkg-config --cflags sdl3) \
#$(shell pkg-config --cflags freetype2) -DLINUX_INSTALL
#FREETYPELIBS = $(shell pkg-config --libs freetype2)
#GLEWLIBS = $(shell pkg-config --libs glew)
#SDLLIBS = $(shell pkg-config --libs sdl3)
#LDLIBS = -lm -lutil  $(GLEWLIBS) $(SDLLIBS) $(FREETYPELIBS)
#
## use main-windows-mingw.c
#CC=x86_64-w64-mingw32-gcc
#EXECUTABLE=zim.exe
#
#CFLAGS = -g -Wall -lm -DWINDOWS_COMPILE -DSDL2_COMPILE -DSDL_COMPILE  \
#$(shell x86_64-w64-mingw32-sdl2-config --cflags) \
#-I/usr/x86_64-w64-mingw32/include/freetype2
#
#FREETYPELIBS = -lfreetype
#GLEWLIBS = -lglew32 -lopengl32 -mwindows -Lglu32
#SDLLIBS = $(shell x86_64-w64-mingw32-sdl2-config --libs)
#LDLIBS = -lm -lmingw32   $(GLEWLIBS) $(SDLLIBS) $(FREETYPELIBS)
#
## add -pg for gdb
#
# windows
CC= x86_64-w64-mingw32-gcc
EXECUTABLE=zim.exe
CFLAGS = -DWINDOWS_COMPILE -DSDL_COMPILE \
	$(shell pkg-config --cflags sdl3) \
	$(shell pkg-config --cflags freetype2)

LDLIBS = -pg -lglew32 -lglu32 -lopengl32 $(shell pkg-config --libs glew) $(shell pkg-config --libs sdl3) $(shell pkg-config --libs freetype2) $(shell pkg-config --libs libpng)

SOURCES=main.c \
	text_editor.c window.c graphics.c log.c freetype.c file_browser.c config.c json.c

OBJECTS=$(SOURCES:.c=.o)

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDLIBS) -o $@

#all: createResourcesO $(SOURCES) $(EXECUTABLE)
#
#$(EXECUTABLE): $(OBJECTS) icon.o
#	$(CC) $(OBJECTS) icon.o $(LDLIBS) -o $@
#
#
#createResourcesO: icon.rc
#	x86_64-w64-mingw32-windres icon.rc -o icon.o
#

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf *.o