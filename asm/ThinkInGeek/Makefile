PRG=first first-twist sum01 sum02 load01 load01-orig \
    store01 branch01 branching

all: $(PRG)

$(PRG) : % : %.s
	gcc -o $@ $^

clean:
	rm -f $(PRG) $(patsubst %,%.o,$(PRG))

