TEXFILES := $(shell find interros -name '*.tex')
PDFS := $(patsubst %.tex,build/%.pdf,$(TEXFILES))

all:
	@mkdir -p build
	@for f in $(TEXFILES); do \
	  d=$$(dirname $$f); b=$$(basename $$f .tex); \
	  mkdir -p build/$$d; \
	  (cd $$d && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=../../build/$$d $$b.tex); \
	done

clean:
	rm -rf build
