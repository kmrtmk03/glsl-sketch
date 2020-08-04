uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;


float random (in vec2 _st) {
    return fract(sin(dot(_st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

float noise (in vec2 _st) {
    vec2 i = floor(_st);
    vec2 f = fract(_st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

#define NUM_OCTAVES 5

float fbm ( in vec2 _st) {
    float v = 0.0;
    float a = 0.5;
    vec2 shift = vec2(100.0);
    // Rotate to reduce axial bias
    mat2 rot = mat2(cos(0.5), sin(0.5),
                    -sin(0.5), cos(0.50));
    for (int i = 0; i < NUM_OCTAVES; ++i) {
        v += a * noise(_st);
        _st = rot * _st * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}


void main( void ) {

	vec2 p = 5.0 * ( gl_FragCoord.xy * 2.0 - resolution.xy ) / min(resolution.x, resolution.y);

	for(float i = 0.0; i < 5.0; i++) {
		p.x += abs(cos(length(p) / cos(20.0)));
		p.y += abs(sin(length(p.x * 1.0) + time));
	}

	float len = length(p);

	float myNoise = noise(vec2(p.y * p.x));

	vec3 color = vec3(1.0) - vec3(sin(myNoise));

	gl_FragColor = vec4(color, 1.0);

}
