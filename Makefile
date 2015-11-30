DESTDIR    ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALLDIR = $(DESTDIR)/tex/latex/mtheme
DOCDIR     = $(DESTDIR)/doc/latex/mtheme

.PHONY: all install clean

all: gotham.sty gotham.pdf

install: gotham.sty gotham.pdf
	mkdir -p $(INSTALLDIR)
	cp gotham.sty $(INSTALLDIR)
	mkdir -p $(DOCDIR)
	cp gotham.pdf $(DOCDIR)

clean:
	rm -f gotham.aux gotham.glo gotham.idx gotham.log gotham.pdf

gotham.sty: gotham.dtx gotham.ins
	latex gotham.ins

gotham.pdf: gotham.dtx
	pdflatex $<
