# Minimal makefile for Sphinx documentation
#

ifeq ($(VERBOSE),1)
  Q =
else
  Q = @
endif

# You can set these variables from the command line.
SPHINXOPTS    ?= -q
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = "Smacc2 Documentation"
SOURCEDIR     = .
BUILDDIR      = _build

DOC_TAG      ?= development
RELEASE      ?= latest
PUBLISHDIR    = /tmp/smacc2
GITHUB_TOKEN  = None
GITHUB_USER   = None

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo ""
	@echo "make publish"
	@echo "   publish generated html to thesofproject.github.io site:"
	@echo "   specify RELEASE=name to publish as a tagged release version"
	@echo "   and placed in a version subfolder.  Requires repo merge permission."

.PHONY: help Makefile

# Generate the doxygen xml (for Sphinx) and copy the doxygen html to the
# api folder for publishing along with the Sphinx-generated API docs.

html:
	$(Q)$(SPHINXBUILD) -t $(DOC_TAG) -b html -d $(BUILDDIR)/doctrees $(SOURCEDIR) $(BUILDDIR)/html $(SPHINXOPTS) $(O)

# Remove generated content (Sphinx and doxygen)

clean:
	rm -fr $(BUILDDIR)

# Copy material over to the GitHub pages staging repo
# along with a README

publish:
	echo pulling doc from user $(GITHUB_USER)
	rm -Rf $(PUBLISHDIR)
	git clone --reference . -b gh-pages https://$(GITHUB_USER):$(GITHUB_TOKEN)@github.com/robosoft-ai/SMACC2_Documentation_II.git $(PUBLISHDIR)
	cd $(PUBLISHDIR) && \
	git config user.email "techsupport@robosoft.ai" && \
	git config user.name "smacc2-ci"

	rm -fr $(PUBLISHDIR)/*

	ls $(PUBLISHDIR)
	cp -r $(BUILDDIR)/html/* $(PUBLISHDIR)
	ls $(PUBLISHDIR)
	cp scripts/.nojekyll $(PUBLISHDIR)/.nojekyll
	cp scripts/CNAME $(PUBLISHDIR)/CNAME
	cd $(PUBLISHDIR) && \
	git add -A && \
	git diff-index --quiet HEAD || \
	(git commit -s -m "[skip ci] publish $(RELEASE)" && git push origin)


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile doxy
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
