varying vec2 newUv;
uniform vec2 iDeviceRatio;
uniform float iTime;

// cosine based palette, 4 vec3 params, from : https://iquilezles.org/articles/palettes/
vec3 palette( float t )
{
	vec3 a = vec3(0.5);
	vec3 b = vec3(0.5);
	vec3 c = vec3(1.0, 1.0, 0.5);
	vec3 d = vec3(0.80, 0.90, 0.30);

    return a + b*cos( 6.28318*(c*t+d) );
}

void main(){
	vec2 uv = (newUv * 2.0 - 1.0) * vec2(iDeviceRatio.x / iDeviceRatio.y, 1.0);
	vec2 uv0 = uv;
	vec3 finalColor = vec3(0.0);

	for (float i = 0.0; i < 4.0; i++){
		uv = fract(uv * 1.5) - 0.5;

		vec3 color = palette(length(uv0) + iTime * 0.4);

		float radius = length(uv) + i * 0.1 * exp(-length(uv0));
		radius = sin(radius * 8.0 + iTime) / 8.0;
		radius = abs(radius);
		radius = pow(0.01 / radius, 1.2);	

		finalColor += color * radius;
	}

	gl_FragColor = vec4(finalColor, 1.0);
}