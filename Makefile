.PHONY: output

CC = xelatex
OUTPUT_DIT = output
THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

CV_SHORT_DIR = cv
CV_SHORT_SRCS = $(shell find $(CV_SHORT_DIR) -name '*.tex')

WORK_EXP_DIR = work_expirience
WORK_EXP_SRCS = $(shell find $(WORK_EXP_DIR) -name '*.tex')

output: $(foreach x, cv coverletter work_expirience, $x.pdf)

cv.pdf: cv.tex $(CV_SHORT_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIT) $<

work_expirience.pdf: work_expirience.tex $(WORK_EXP_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIT) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIT) $<

clean:
	rm -rf $(OUTPUT_DIT)/*.pdf

watch_cv:
	fswatch -e '.git' -e output -o . | xargs -n1 -I{} bash -c "make cv.pdf && ./preview.sh $(THIS_DIR)/output/cv.pdf"
