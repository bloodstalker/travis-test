TARGET=main
CXX=clang++
CXX?=clang++
CXX_FLAGS=-std=c++11
CXX_EXTRA?=
CXX_FLAGS+=$(CXX_EXTRA)

SRCS=$(wildcard *.cpp)

.DEFAULT:all

.PHONY:all clean help

all:$(TARGET)

depend:.depend

.depend:$(SRCS)
	rm -rf .depend
	$(CXX) -MM $(CXX_FLAGS) $^ > ./.depend

-include ./.depend

.cpp.o:
	$(CXX) $(CXX_FLAGS) -c $< -o $@ 

$(TARGET): $(TARGET).o
	$(CXX) $^ $(LD_FLAGS) -o $@

clean:
	rm -f *.o *~ $(TARGET)
	rm .depend

help:
	@echo "all is the default target"
	@echo "there is clean."
