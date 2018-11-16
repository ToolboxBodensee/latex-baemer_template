FILE=main
PDFVIEWER := $(shell which evince)

all: $(FILE).pdf

.PHONY: clean
clean:
	\rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb
	\rm -f sections/*.aux

.PHONY: distclean
distclean: clean
	\rm -f $(FILE).pdf $(FILE).pdfpc
	\rm -f handout.pdf handout.pdfpc
	\rm -f toolbox_logo_orange-eps-converted-to.pdf

.PHONY: view
view:   $(FILE).pdf
	\$(PDFVIEWER) $(FILE).pdf

.PHONY: handout
handout: handout.pdf

$(FILE).pdf: $(FILE).tex
	pdflatex $(FILE)
	pdflatex $(FILE)

handout.pdf: $(FILE).tex
	pdflatex handout 
	pdflatex handout 
	bibtex handout
	pdflatex handout
	pdflatex handout
	
