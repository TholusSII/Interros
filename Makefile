TEXFILES := $(shell find interros -name '*.tex')
PDFS := $(patsubst %.tex,build/%.pdf,$(TEXFILES))

.PHONY: all prepare clean

all: prepare
	@mkdir -p build
	@for f in $(TEXFILES); do \
	  d=$$(dirname $$f); b=$$(basename $$f .tex); \
	  mkdir -p build/$$d; \
	  (cd $$d && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=../../build/$$d $$b.tex); \
	done

prepare:
	@echo "Restauration des packages du framework des khôlles"
	@base64 --decode framework/vendor/rpcinematik.sty.gz.b64 | gzip --decompress > framework/rpcinematik.sty
	@base64 --decode framework/vendor/rp-sysml.sty.gz.b64 | gzip --decompress > framework/rp-sysml.sty
	@test -s framework/rpcinematik.sty
	@test -s framework/rp-sysml.sty

clean:
	rm -rf build
	rm -f framework/rpcinematik.sty framework/rp-sysml.sty
	find interros -type f \( -name '*.aux' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' -o -name '*.out' -o -name '*.pdf' \) -delete
