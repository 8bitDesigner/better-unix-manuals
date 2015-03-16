PATH     := ./bin:node_modules/.bin:$(PATH)
chrome   := /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
extpath  := ./extension
extfile  := extension.crx
manifest := $(extpath)/manifest.json

$(extfile): extension.pem
	$(chrome) --pack-extension=$(extpath) --pack-extension-key=$<

release: $(extfile) $(manifest)
	release `version $(manifest) minor` $(extfile)

clean:
	git co -- $(manifest)
	rm extension.crx

.PHONY: clean release
