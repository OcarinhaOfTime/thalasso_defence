shader_type canvas_item;

uniform vec4 color : source_color = vec4(1);
//uniform float fill : hint_range(0, .5) = .3;

void fragment() {
	COLOR = color * texture(TEXTURE, UV);
}
