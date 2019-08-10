.PHONY: output

CC = xelatex
OUTPUT_DIT = output

CV_SHORT_DIR = cv_short
CV_SHORT_SRCS = $(shell find $(CV_SHORT_DIR) -name '*.tex')

CV_DIR = cv_short
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

output: $(foreach x, coverletter cv_short, $x.pdf)

cv_short.pdf: cv_short.tex $(CV_SHORT_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIT) $<

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIT) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIT) $<

clean:
	rm -rf $(OUTPUT_DIT)/*.pdf
