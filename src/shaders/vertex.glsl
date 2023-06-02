uniform vec2 iResolution;
varying vec2 vertexUV;

void main() {
  vertexUV = (uv - 0.5) * 2.0 * vec2(iResolution.x / iResolution.y, 1.0);
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
