TEXFILE = slides.tex
PDFFILE = $(TEXFILE:.tex=.pdf)
DEPFILES = $(wildcard *.tex)

.PHONY: $(PDFFILE)

# all: genref $(PDFFILE)
all: $(PDFFILE)

$(PDFFILE): $(TEXFILE) $(DEPFILES)
	mkdir -p out
	dot -Tpdf -o out/abc.pdf out/abc.dot
	latexmk -pdf $(TEXFILE) -outdir=out

clean:
	latexmk -C -outdir=out
