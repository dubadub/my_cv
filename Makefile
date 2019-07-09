.PHONY: output

CC = xelatex
OUTPUT_DIT = output
CV_DIR = cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

output: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIT) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIT) $<

clean:
	rm -rf $(OUTPUT_DIT)/*.pdf
