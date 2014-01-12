all: jgross-coq-8-6-wishlist.pdf

clean:
	rm -f *.aux *.out *.nav *.toc *.vrb *.pdf *.snm *.log *.bbl *.blg

.PHONY: all clean

%.pdf: %.tex
	pdflatex -interaction=batchmode $< || true
	pdflatex -interaction=batchmode $< || true
	pdflatex $<
