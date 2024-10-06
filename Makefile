all: main

main:
	haxe compile.hxml
	webpack
	cp bin/index.html dist/build/index.html

serve:
	http-server dist/build/.

clean:
	rm -rf build
