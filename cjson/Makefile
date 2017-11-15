#
# Cross Platform Makefile
#

#CXX = g++

OBJS = fpconv.o lua_cjson.o strbuf.o

UNAME_S := $(shell uname -s)


ifeq ($(UNAME_S), Linux) #LINUX
	ECHO_MESSAGE = "Linux"
	LIBS += -L/usr/local/lib -lluajit-5.1.2.0.5
	EXE = libcjson

	CXXFLAGS = -I/usr/local/include/luajit-2.0/
	CXXFLAGS += -Wall -Wformat
	CFLAGS = $(CXXFLAGS)
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	ECHO_MESSAGE = "Mac OS X"
	LIBS += -L/usr/local/lib -lluajit-5.1.2.0.5
	EXE = libcjson.dylib

	CXXFLAGS = -I/usr/local/include/luajit-2.0/
	CXXFLAGS += -Wall -Wformat
	CFLAGS = $(CXXFLAGS)
endif

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: $(EXE)
	@echo Build complete for $(ECHO_MESSAGE)

$(EXE): $(OBJS)
	$(CXX) -shared -o $(EXE) $(OBJS) $(CXXFLAGS) $(LIBS)

clean:
	rm $(EXE) $(OBJS)
