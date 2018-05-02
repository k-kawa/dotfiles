.PHONY: all

all:
	@make build
	@make install

build:
	bin/filter-all

install:
	bin/ln-all


