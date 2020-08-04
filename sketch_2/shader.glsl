uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec2 p = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

	vec3 destColor = vec3(0.0);

	float l = 2.0 / length(p.y + sin(p.x * p.y * 4.0 + time / 2.0)) - 20.0;

	destColor = vec3(l);

	gl_FragColor = vec4(destColor, 1.0);
}
