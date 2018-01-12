PACKAGE = uottawaionchannel
VERSION = 0.31

LATEX := $(shell pdflatex -v 2> /dev/null)

BUILD := builds/$(shell date +'%Y-%m-%d_%H-%M-%S')

all: deps docs build check

deps:
	Rscript -e 'if (!require("devtools"))  install.packages("devtools",  repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("roxygen2"))  install.packages("roxygen2",  repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("rmarkdown")) install.packages("rmarkdown", repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("knitr"))     install.packages("knitr",     repos="http://cran.rstudio.com")'

docs:
ifdef LATEX
	R -e 'devtools::document()'
endif

build: 
ifdef LATEX
	R CMD build .
else
	R CMD build . --no-build-vignettes
endif

$(PACKAGE)_$(VERSION).tar.gz:
	$(MAKE) build

install: $(PACKAGE)_$(VERSION).tar.gz
	R CMD INSTALL $(PACKAGE)_$(VERSION).tar.gz

check: build
	R CMD check $(PACKAGE)_$(VERSION).tar.gz --as-cran

clean:
	$(RM) -r $(PACKAGE).Rcheck/
	$(RM) $(PACKAGE)_$(VERSION).tar.gz
	$(RM) -r builds/

export: $(PACKAGE)_$(VERSION).tar.gz check
	@echo Copying tarball and manuals to ${BUILD}
	@mkdir -p ${BUILD}
	@cp uottawaionchannel.Rcheck/uottawaionchannel-manual.pdf ${BUILD}
	@cp uottawaionchannel.Rcheck/uottawaionchannel/doc/uottawaionchannel.pdf ${BUILD}
	@cp $(PACKAGE)_$(VERSION).tar.gz ${BUILD}
