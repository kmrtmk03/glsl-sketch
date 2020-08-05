uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec2 p = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

	vec3 destColor = vec3(0.0);
	for(float i = 0.0; i < 4.0; i++) {

		float j = i + 1.0;
		float myTime = time / 10.0;

		vec2 q = p + vec2(cos(j + myTime * j), sin(myTime * j));

		float len = 0.1 / length(q);

		destColor += len;
	}

	gl_FragColor = vec4(destColor, 1.0);
}
