varying vec2 vertexUV;
float scale = 1.0;

void main(){
  vertexUV = uv;
  gl_Position = vec4( projectionMatrix * modelViewMatrix * vec4( position, scale ));
}