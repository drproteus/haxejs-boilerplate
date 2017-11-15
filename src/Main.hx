import js.Browser;
import js.three.*;


class NeatCube {
    public var cube:js.three.Mesh;
    private var speed:Float;

    public function new() {
        this.speed = 0.01;
        this.cube = new Mesh(new CubeGeometry(2, 2, 2), new MeshNormalMaterial());
    }

    public function rotate() : Void {
        this.cube.rotation.x -= this.speed * 2;
        this.cube.rotation.y -= this.speed;
        this.cube.rotation.z -= this.speed * 3;
    }
}


class NeatScene {
    public var width:Int;
    public var height:Int;
    private var scene:js.three.Scene;
    private var camera:js.three.Camera;
    private var renderer:js.three.Renderer;
    private var cube:NeatCube;

    public function new() {
        this.width = Browser.window.innerWidth;
        this.height = Browser.window.innerHeight;

        this.scene = new Scene();

        this.camera = this.initCamera();
        this.renderer = this.initRenderer();

        this.cube = new NeatCube();
        this.scene.add(this.cube.cube);

        Browser.document.body.appendChild(this.renderer.domElement);
    }

    function initCamera() {
        var camera = new PerspectiveCamera(70, this.width/this.height, 1, 10);
        camera.position.set(0, 3.5, 5);
        camera.lookAt(this.scene.position);
        return camera;
    }

    function initRenderer() : Renderer {
        var renderer = new WebGLRenderer({ antialias: true });
        renderer.setSize(this.width, this.height);
        return renderer;
    }

    public function render(step:Float) : Void {
        Browser.window.requestAnimationFrame(this.render);
        this.cube.rotate();
        this.renderer.render(this.scene, this.camera);
    }
}

class Main {
    static function main() {
        var s = new NeatScene();
        s.render(0);
    }
}