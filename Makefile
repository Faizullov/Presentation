TEX_SOURCE := slides

BUILDPARAM = -cd -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape
WATCHPARAM = -pvc -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape
TEMP_FILES = *.nav *.snm *.vrb *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.xdv *.bbl *.bcf *.blg *.run.xml *.toc ./mainfiles/*.aux

.PHONY: build
build:
	latexmk $(BUILDPARAM) $(TEX_SOURCE).tex

.PHONY: watch
watch:
	latexmk $(WATCHPARAM) $(TEX_SOURCE).tex

.PHONY: clear
clear:
	rm -rf $(TEMP_FILES)

.PHONY: purge
purge: clear
	rm -rf $(TEX_SOURCE).pdf

.PHONY: help
help:
	@printf "Usage: make [options] [target] ...\n"
	@printf "\n"
	@printf "Valid targets:\n"
	@printf "\n"
	@printf "    build              compile the tex-source (default parameter)\n"
	@printf "    watch              compile the tex-source continously\n"
	@printf "    help               display this help message\n"
	@printf "    clear              delete temporary files\n"
	@printf "    purge              delete temporary files and produced pdf\n"
