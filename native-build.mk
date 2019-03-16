SDL_FLAGS := `sdl2-config --cflags`
CXX := g++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb3 $(SDL_FLAGS)
BIN	:= bin
SRC	:= src
INCLUDE	:= include
LIB := lib
GLAD_BUILD_DIR := glad

LIBRARIES := `sdl2-config --libs` -ldl
EXECUTABLE := gs-cross-compile

all: $(BIN)/$(EXECUTABLE)

$(GLAD_BUILD_DIR)/src/*.c:
	python -m glad --out-path=$(GLAD_BUILD_DIR) --api="gl=3.3" --extensions="GL_KHR_debug" --generator="c"

$(BIN)/$(EXECUTABLE): $(SRC)/*.cpp $(GLAD_BUILD_DIR)/src/*.c
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -I$(GLAD_BUILD_DIR)/include -L$(LIB) $^ -o $@ $(LIBRARIES)

clean:
	rm -rf $(BIN)/*
	rm -rf $(GLAD_BUILD_DIR)/*
