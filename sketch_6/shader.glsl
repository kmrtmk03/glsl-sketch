uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	
	vec2 position =  (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
	
	float l =  0.05 / length(position.y * 2.0 + sin(position.x * sin(position.y + time * sin(position.y  / 1000.0)) + time)) ;
	
	float len =0.2 / length(vec2(position.x + sin(time * 2.0), position.y + cos(time)));
	
	float dest = step(abs(sin(position.x)), l / len);
	
	gl_FragColor = vec4(l / dest , len / l, dest, 1.0);
	
}