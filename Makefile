.PHONY: css
css:
	mkdir -p bundle
	postcss --watch --use autoprefixer --user postcss-import css/app.css --output bundle/app.css

.PHONY: js
js:
	webpack -d --watch js/app.js build/app.js --module-bind "js=babel?stage=0" --progress

.PHONY: minjs
minjs:
	webpack -p js/app.js build/app.js --module-bind "js=babel?stage=0" --progress

.PHONY: server
server:
	browser-sync start --port 2333 --server --files='index.html,bundle/app.css,js/app.js,build/app.js'

.PHONY: all
all:
	(make css & make js & make server & wait)

.PHONY: clean
clean:
	rm -r bundle

.DEFAULT_GOAL := all
