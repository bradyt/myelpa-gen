gen:
	(cd home-generate; HOME=.; emacs -batch -l .emacs)

test:
	(cd home-test; HOME=.; emacs .emacs)

batch-test:
	(cd home-test; HOME=.; emacs -batch -l .emacs)

clean:
	(cd home-generate; git clean -dffx)
	(cd home-test; git clean -dffx)
