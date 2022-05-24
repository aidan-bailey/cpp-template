BINNAME := template

CXX := g++
SRCDIR := src
OBJDIR := obj
BINDIR := bin
SRCEXT := cpp

TARGET := $(BINDIR)/$(BINNAME)
TESTER := $(BINDIR)/tester

SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CXXFLAGS := -g # -ggdb -Wall -lm
LIB := -L lib
INC := -I include


$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CXX) $^ -o $(TARGET) $(LIB)"; $(CXX) $^ -o $(TARGET) $(LIB)


$(OBJDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@echo " Building.."
	@mkdir -p $(OBJDIR)
	@echo " $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<"; $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<


clean:
	@echo " Cleaning...";
	@rm -r $(OBJDIR) $(TARGET) $(TESTER) compile_commands.json


tester:
	$(CXX) $(CXXFLAGS) test/tester.cpp $(INC) $(LIB) -o $(TESTER)


.PHONY: clean
