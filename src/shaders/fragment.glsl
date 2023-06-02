uniform float iTime;
varying vec2 vertexUV;

vec3 colorPallete( float t ){
  vec3 a = vec3( 0.5, 0.5, 0.5 );
  vec3 b = vec3( 0.5, 0.5, 0.5 );
  vec3 c = vec3( 1.0, 1.0, 1.0 );
  vec3 d = vec3( 0.263, 0.416, 0.557 );

  return a + b*cos( 6.28318*(c*t+d) );
}

void main(){
  float d = length(vertexUV);
  vec3 color = colorPallete(d + iTime);

  d = sin(d * 9. +  iTime)/8.;
  d = abs(d);
  d = 0.02 / d;

  color *= d;

  gl_FragColor = vec4( color, 1.0 );
}