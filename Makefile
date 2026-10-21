IMAGE := cv-latex
RUN := docker run --rm -v "$(CURDIR)":/work $(IMAGE)
LATEXMK := latexmk -pdf -interaction=nonstopmode -halt-on-error

.PHONY: pdf image watch clean

pdf: image
	$(RUN) $(LATEXMK) cv.tex
	$(RUN) latexmk -c cv.tex

image:
	docker build -q -t $(IMAGE) .

watch: image
	docker run --rm -it -v "$(CURDIR)":/work $(IMAGE) $(LATEXMK) -pvc -view=none cv.tex

clean: image
	$(RUN) latexmk -C cv.tex
