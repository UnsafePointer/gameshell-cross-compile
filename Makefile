CROSSTOOL_HOME := $(HOME)/x-tools/armv7l-unknown-linux-gnueabihf
SYSROOT := $(CROSSTOOL_HOME)/armv7l-unknown-linux-gnueabihf/sysroot
SDL_FLAGS := `$(SYSROOT)/usr/bin/sdl2-config --cflags`
CXX := armv7l-unknown-linux-gnueabihf-g++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb3 $(SDL_FLAGS)
BIN	:= bin
SRC	:= src
INCLUDE	:= include
LIB := lib

LIBRARIES := `$(SYSROOT)/usr/bin/sdl2-config --libs`
EXECUTABLE := gs-cross-compile

all: $(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SRC)/*.cpp
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

clean:
	rm -rf $(BIN)/*
