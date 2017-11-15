all: main

main:
	haxe compile.hxml
	webpack
	cp bin/index.html build/index.html

serve:
	http-server build/.

clean:
	rm -rf build
