.SUFFIXES:
SOURCES=$(wildcard *.s)
PROGRAMS=$(patsubst %.s,%,$(SOURCES))
OBJECTS=$(patsubst %.s,%.o,$(SOURCES))

all: $(PROGRAMS)

$(OBJECTS): %.o : %.s
	as -g $< -o $@

$(PROGRAMS): % : %.o
	ld $< -o $@

clean:
	rm -f *.o $(PROGRAMS)

