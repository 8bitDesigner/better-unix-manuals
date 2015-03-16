PATH     := ./bin:node_modules/.bin:$(PATH)
chrome   := /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
extpath  := ./extension
extfile  := build.crx
manifest := $(extpath)/manifest.json

$(extfile): extension.pem
  crx pack $(extpath) -o $(extfile) -p extension.pem

release: $(extfile) $(manifest)
	release `version $(manifest) minor` $(extfile)

clean:
	git co -- $(manifest)
	rm extension.crx

.PHONY: clean release
