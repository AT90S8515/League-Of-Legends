PREFIX ?= /

BIN_S := leagueoflegends
CFG_S := leagueoflegends.conf
DSK_S := leagueoflegends.desktop
LCS_S := LICENSE
PNG_S := leagueoflegends.png
REG_S := leagueoflegends.reg

BIN_D := $(PREFIX)/usr/bin/leagueoflegends
CFG_D := $(PREFIX)/etc/leagueoflegends.conf
DSK_D := $(PREFIX)/usr/share/applications/leagueoflegends.desktop
LCS_D := $(PREFIX)/usr/share/licenses/leagueoflegends/LICENSE
PNG_D := $(PREFIX)/usr/share/icons/hicolor/256x256/apps/leagueoflegends.png
REG_D := $(PREFIX)/usr/share/doc/leagueoflegends/leagueoflegends.reg


default: help

$(BIN_D): $(BIN_S)
	install -Dm755 $< $@

$(CFG_D): $(CFG_S)
	install -Dm644 $< $@

$(DSK_D): $(DSK_S)
	install -Dm644 $< $@

$(LCS_D): $(LCS_S)
	install -Dm644 $< $@

$(PNG_D): $(PNG_S)
	install -Dm644 $< $@

$(REG_D): $(REG_S)
	install -Dm644 $< $@

install: ## Install leagueoflegends wine
install: $(BIN_D) $(CFG_D) $(DSK_D) $(LCS_D) $(PNG_D) $(REG_D)

uninstall: ## Delete leagueoflegends wine
uninstall:
	@rm -fv $(BIN_D) $(CFG_D) $(DSK_D) $(LCS_D) $(PNG_D) $(REG_D)


deb: ## Create debian package
deb:
	./package.sh debian

help: ## Show help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/## /\t/'

.PHONY: default install uninstall deb help
