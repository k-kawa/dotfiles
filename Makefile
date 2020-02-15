.PHONY: all

all:
	@make build
	@make install
	@make book

build:
	bin/filter-all

install:
	bin/ln-all

book:
	mdbook build --dest-dir docs
