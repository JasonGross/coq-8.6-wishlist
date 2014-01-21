all: jgross-coq-8-6-wishlist.pdf jgross-coq-8-6-wishlist-no-pause.pdf jgross-coq-8-6-wishlist-light.pdf

clean:
	rm -f *.aux *.out *.nav *.toc *.vrb *.pdf *.snm *.log *.bbl *.blg jgross-coq-8-6-wishlist-no-pause.tex jgross-coq-8-6-wishlist-light.tex

.PHONY: all clean

%-light.tex: %.tex
	sed s'/{albatross}/{beaver}/g' $< > $@

%-no-pause.tex: %.tex
	sed s'/\\pause//g' $< | sed s'/<[0-9]*-[0-9]*>//g' | sed s'/\\only//g' | sed s'/{albatross}/{beaver}/g' > $@

%.pdf: %.tex
	pdflatex -interaction=batchmode $< || true
	pdflatex -interaction=batchmode $< || true
	pdflatex $<
