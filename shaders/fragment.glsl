uniform sampler2D imageTexture;
varying vec2 vertexUV;
void main(){
  vec4 outputTexture = texture( imageTexture, vertexUV );
  vec4 gradientColor = vec4( vertexUV, 1.0, 1.0 );
  gl_FragColor = gradientColor;
}