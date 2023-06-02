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
  vec3 finalColor = vec3(0.0);
  vec2 vertexUV0 = vertexUV;

  for (float i = 0.0; i < 4.0; i++){
    vec2 vertexUV = fract(vertexUV * 4.0) - 0.5;
    float distance = length(vertexUV) * exp(-length(vertexUV0));
    vec3 color = colorPallete(length(vertexUV0) + i*4. + iTime*.5);

    distance = sin(distance * 8. - iTime)/8.;
    distance = abs(distance);
    distance = pow(0.01 / distance, 1.2);

    finalColor += color * distance;
  }

  gl_FragColor = vec4( finalColor, 1.0 );
}