SHELL    := /bin/bash
PATH     := ./bin:node_modules/.bin:$(PATH)
chrome   := /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
extpath  := ./extension
extfile  := build.crx
manifest := $(extpath)/manifest.json

$(extfile): extension.pem
	crx pack $(extpath) -o $(extfile) -p extension.pem

rev:
	version $(manifest) minor
	git add $(manifest) package.json
	git ci -m'Bumping version' && git push origin master

release: rev $(extfile)
	release `version $(manifest)` $(extfile)

clean:
	git co -- package.json
	git co -- $(manifest)
	rm *.crx

.PHONY: clean rev release
