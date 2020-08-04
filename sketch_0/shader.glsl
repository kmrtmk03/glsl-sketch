//http://glslsandbox.com/e#66536.0

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;

const vec3 tint = vec3(0.1, 0.9, 0.4);
const vec3 bgColor = vec3(1.0, 1.0, 1.0);

#define MODE_2
#define ITERATION 10.0

void main() {
	vec2 p = (2.0 * gl_FragCoord.xy - resolution) / min(resolution.x, resolution.y);

	for(float i = 1.0; i < ITERATION; i++) {
		p.x += 1.0 / i * sin(i * p.y) + 1.0 - (mouse.x * 0.5);
		p.y += mouse.y * 2.0 / i * cos(i * p.x) * pow(time, 0.3);
	}

	vec3 col;
	col = vec3(sin(p.x), 0.3, sin(p.y));

	gl_FragColor = vec4(col, 1.0);
}
