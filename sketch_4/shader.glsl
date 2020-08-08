uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 p = 1.0 * (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
	
	float len = 0.05 / length(p.x + sin(exp(p.y + cos(p.x) * p.x) + time));

	float d = dot(p, vec2(len));
	
	vec3 dest = vec3(step(d - p.x, 0.5), step(d * p.y + p.x, cos(p.x * p.y * time / 200.0)), step(d / p.y, 0.5));
	
	gl_FragColor = vec4(dest, 1.0);

}