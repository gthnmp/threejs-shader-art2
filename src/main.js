import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import vertexShader from '../shaders/vertex.glsl';
import fragmentShader from '../shaders/fragment.glsl';
import image from './assets/Indonesia.jpg';

class Sketch {
  constructor() {
    this.canvasContainer = document.querySelector("#canvas-container");
    this.WIDTH = this.canvasContainer.offsetWidth;
    this.HEIGHT = this.canvasContainer.offsetHeight;

    this.scene = new THREE.Scene();
    this.scene.background = new THREE.Color("white");

    this.camera = this.usePerspectiveCamera(); // Use perspective camera by default

    this.renderer = new THREE.WebGLRenderer({ antialias: true, canvas: document.querySelector("canvas") });
    this.renderer.setSize(this.WIDTH, this.HEIGHT);

    this.useOrbitControl();
    this.addObject();

    this.camera.position.z = 1;
  }

  usePerspectiveCamera() {
    return new THREE.PerspectiveCamera(
      75,
      this.WIDTH / this.HEIGHT,
      0.1,
      1000
    );
  }

  useOrthographicCamera() {
    return new THREE.OrthographicCamera(
      -0.5, 0.5,
      0.5, -0.5,
      -1000, 1000
    );
  }

  useCamera(cameraType) {
    if (cameraType === 'perspective') {
      this.camera = this.usePerspectiveCamera();
    } else if (cameraType === 'orthographic') {
      this.camera = this.useOrthographicCamera();
    }
  }

  useOrbitControl() {
    this.controls = new OrbitControls(this.camera, this.renderer.domElement)
  }

  addObject() {
    const imageObject = new THREE.Mesh(
      new THREE.PlaneGeometry(1, 1),
      new THREE.ShaderMaterial({
        vertexShader: vertexShader,
        fragmentShader: fragmentShader,
        side: THREE.DoubleSide,
        uniforms: {
          imageTexture: { value: new THREE.TextureLoader().load(image) }
        }
      })
    );
    this.scene.add(imageObject);
  }

  animate() {
    requestAnimationFrame(this.animate.bind(this));
    this.controls.update();
    this.renderer.render(this.scene, this.camera);
  }
}

const sketch = new Sketch();
sketch.animate();
// sketch.useCamera('orthographic');
