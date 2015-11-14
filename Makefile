# The list of files we want to go into core.js, which is concat'd and
# minified. These files should be either present in the project, brought
# into third_party/bower_compoents via bower, or in node_modules.
CORE_SOURCE_FILES = node_modules/native-promise-only/npo.js \
	third_party/bower_components/webcomponentsjs/webcomponents.min.js \
	res/js/common.js

BOWER_DIR=third_party/bower_components

VULCANIZE1=true

default: core_js elements_html
	go install -v ./go/mathserv

release: default
	./build_mathserv_release "$(MESSAGE)"

.PHONY: debug
debug: clean_webtools debug_core_js debug_elements_html

include ../../../go.skia.org/infra/webtools/webtools.mk
