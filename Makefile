.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL = help

# ANSI codes
BOLD=[1m
DIM=[2m
ITALIC=[3m
RESET=[0m

.PHONY: help # Print this help message and exit
help:
	@ printf "\e$(BOLD)Targets:\e$(RESET)\n\n"
	@ @grep -E '^.PHONY:' $(shell printf "%s\n" $(MAKEFILE_LIST) | tac) | \
		grep "#" | sed 's,.*: ,,' | \
		awk 'BEGIN {FS = " # "}; {printf "  make %s,%s\n", $$1, $$2}' | \
		column -t -s ',' | \
		sed -E 's,(.*make )([^ ]+)( .*),\1\x1b$(ITALIC)\2\x1b$(RESET)\3,'


define print-target
	@ printf "\e$(BOLD)Make target:\e$(RESET) %s\n" $@
endef

# NOTE: Commented out until the tooling matures
# .PHONY: glossary
# glossary:
# 	docops-gloss-terms --quiet docs

all: misc
.PHONY: misc # Run misc checks
misc:
	$(call print-target)
	@ ci/misc.sh

all: ec
.PHONY: ec # Run EditorConfig check
ec:
	$(call print-target)
	@ ec

all: wtf
.PHONY: wtf # Run Whitespace Total Fixer
wtf:
	$(call print-target)
	@ find . -type f \
		-not -path './.git/*' \
		-exec grep -Iq . {} \; -print0 | \
		xargs -0 wtf --quiet -E lf --dry-run

all: lintspaces
.PHONY: lintspaces # Run lintspaces
lintspaces:
	$(call print-target)
	@ find . -type f \
		-not -path './.git/*' \
		-exec grep -Iq . {} \; -print0 | \
		xargs -0 lintspaces --editorconfig .editorconfig --matchdotfiles

all: prettier
.PHONY: prettier # Run Prettier
prettier:
	$(call print-target)
	@ find . -type f \
		-not -path './.git/*' -not -path '*.md' \
		-exec grep -Iq . {} \; -print0 | \
		xargs -0 prettier --check --ignore-unknown

all: yamllint
.PHONY: yamllint # Run yamllint
yamllint:
	$(call print-target)
	@ find . -type f -name '*.yaml' -print0 | \
		xargs -0 yamllint

all: shellcheck
.PHONY: shellcheck # Run ShellCheck
shellcheck:
	$(call print-target)
	@ shellcheck **/*.sh

all: dockerfilelint
.PHONY: dockerfilelint # Run dockerfilelint
dockerfilelint:
	$(call print-target)
	@ find . -type f -name 'Dockerfile' -print0 | \
		xargs -0 dockerfilelint

all: cspell
.PHONY: cspell # Run cSpell
cspell:
	$(call print-target)
	@ find . -type f \
		-not -path './.git/*' -not -path './.cspell.txt' -print0 | \
		xargs -0 cspell --config .cspell.json --no-progress --no-summary

all: misspell
.PHONY: misspell # Run misspell
misspell:
	$(call print-target)
	@ find . -type f \
		-not -path './.git/*' -print0  | \
		xargs -0 misspell -locale US --

all: woke
.PHONY: woke # Run woke
woke:
	$(call print-target)
	@ woke

all: proselint
.PHONY: proselint # Run proselint
proselint:
	$(call print-target)
	@ proselint **/*.md

all: markdownlint
.PHONY: markdownlint # Run markdownlint
markdownlint:
	$(call print-target)
	@ markdownlint .

all: markdown-link-check
.PHONY: markdown-link-check # Run markdown-link-check
markdown-link-check:
	$(call print-target)
	@ find . -type f -name '*.md' | \
		parallel -k \
		markdown-link-check --quiet --config .markdown-link-check.json

.PHONY: all # Make all targets
all:
