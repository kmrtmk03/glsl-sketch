uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 p = 1.0 * (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);


	float len = 0.01 / length(p.x + sin(p.y * 5.0 + time));


	float len2 = 0.5 / length(p.x + sin(p.y * 2.0) + 0.2);

	len *= len2;

	float circle = 2.5 / length(vec2(sin(p.x + time), p.y));

	len *= circle;


	vec3 color = 1.0 - vec3(step(len, 0.3));



	gl_FragColor = vec4(color, 1.0);

}
