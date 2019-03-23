PROGRAM := solution

all: $(PROGRAM)

$(PROGRAM): %: %.nim
	nim c -r $<

clean:
	@rm -f $(PROGRAM)
	@rm -fr nimcache
