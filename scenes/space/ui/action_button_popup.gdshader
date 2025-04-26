shader_type canvas_item;

uniform float speed = 1.0;
uniform float width = 0.2;
uniform float intensity = 1.5;
uniform vec4 shine_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform bool enabled = true;

void fragment() {
    vec2 uv = UV;

    vec4 tex_color = texture(TEXTURE, uv);

    float shine_pos = -1.0 + mod(TIME * speed, 2.5);

    float dist = abs(uv.x - shine_pos);

    float shine = smoothstep(width, 0.0, dist) * intensity;
	
	if (enabled) {
	    COLOR = tex_color + shine * shine_color;
	    COLOR.a = tex_color.a;
	} else {
		COLOR = tex_color;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
