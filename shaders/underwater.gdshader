shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform sampler2D noise_texture: filter_nearest, repeat_enable;

uniform vec2 speed = vec2(.5, .2);
uniform float distortion = .01;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV + speed * TIME;
	
	vec2 noise = 2.0 + texture(noise_texture, UV).rg - vec2(1.0);
	
	COLOR = texture(TEXTURE, UV);
	COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
