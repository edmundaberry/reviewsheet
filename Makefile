LATEX_FILE = reviewsheet
TEX        = pdflatex
TMP_FOLDER = ./tmp/
TEX_FOLDER = ./tex/

TEX_SUB_FILES = $(shell find . -name '*.tex' | grep -v '.\#')

$(TMP_FOLDER)$(LATEX_FILE).pdf: $(LATEX_FILE).tex $(TEX_SUB_FILES) 
# Run tex 
	$(TEX) -output-directory=$(TMP_FOLDER) $(LATEX_FILE)
# copy output
	cp $(TMP_FOLDER)/$(LATEX_FILE).pdf .

pdf	: $(TMP_FOLDER)$(LATEX_FILE).pdf
all	: pdf
clean	:
	rm -f *~
	rm -f $(TMP_FOLDER)/*
	rm -f $(LATEX_FILE).ilg
	rm -f $(LATEX_FILE).nls
	rm -f $(LATEX_FILE).nlo
	rm -f $(LATEX_FILE).log
	rm -f $(LATEX_FILE).out
	rm -f $(LATEX_FILE).toc
	rm -f $(LATEX_FILE).aux 
	rm -f $(LATEX_FILE).pdf


