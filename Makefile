all: main

main:
	npm run build
	cp bin/index.html build/index.html

serve:
	http-server build/.
