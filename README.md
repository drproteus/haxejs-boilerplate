# HaxeJS + Webpack Starter Pack
### Provides example with ThreeJS

Built with haxe 3.4.4, not sure what breaks with versioning.

* `haxelib install requirements.hxml`
* `make`
* `make serve` to serve on port 8080 (by default)

In `bin/` you will find `shim.js` which serves as an intermediary of consolidating JS library imports, setting up globals for the Haxe generated JS to consume, and finally requiring the generate JS itself.

We feed `shim.js` to webpack to fully compile the JavaScripts. The result is `index.js`, this gets placed at the tail end of `index.html`