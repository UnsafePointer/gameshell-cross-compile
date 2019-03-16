SDL_FLAGS := `sdl2-config --cflags`
CXX := g++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb3 $(SDL_FLAGS)
BIN	:= bin
SRC	:= src
INCLUDE	:= include
LIB := lib

LIBRARIES := `sdl2-config --libs`
EXECUTABLE := gs-cross-compile

all: $(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SRC)/*.cpp
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

clean:
	rm -rf $(BIN)/*
