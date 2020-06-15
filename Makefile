CXX := g++
CXXFLAGS := --std=c++11 -ggdb -Wall -lm
OBJ  := obj
TARGET   := Template
INCLUDE  := -Ilibs/ -Iinclude/
SRC      := $(wildcard src/*.cpp) \

OBJECTS  := $(SRC:%.cpp=$(OBJ)/%.o)

all: build $(TARGET)

$(OBJ)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $^

.PHONY: all build clean development testing

development:
	compiledb make
tags:
	ctags -R --exclude compile_commands.json --exclude .* --exclude docs --exclude dataset --exclude Makefile .

build:
	@mkdir -p $(OBJ)

clean:
	-@rm -rvf $(OBJ)
	-@rm -rvf Template
