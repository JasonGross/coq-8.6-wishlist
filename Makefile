all: jgross-coq-8-6-wishlist.pdf jgross-coq-8-6-wishlist-no-pause.pdf

clean:
	rm -f *.aux *.out *.nav *.toc *.vrb *.pdf *.snm *.log *.bbl *.blg jgross-coq-8-6-wishlist-no-pause.tex

.PHONY: all clean

%-no-pause.tex: %.tex
	sed s'/\\pause//g' $< | sed s'/<[0-9]*-[0-9]*>//g' | sed s'/\\only//g' > $@

%.pdf: %.tex
	pdflatex -interaction=batchmode $< || true
	pdflatex -interaction=batchmode $< || true
	pdflatex $<
