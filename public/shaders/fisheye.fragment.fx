#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate texture coordinate to the range [-1.0, 1.0]
    vec2 coord = model_uv * 2.0 - 1.0;

    // Calculate theta and radius
    float theta = atan(coord.y, coord.x);
    float radius = pow(length(coord), 1.5);

    // Calculate fish-eye texture coordinate
    vec2 fish_eye_coord = radius * vec2(cos(theta), sin(theta));

    // Re-scale final texture coordinate to the range [0.0, 1.0]
    vec2 final_uv = 0.5 * (fish_eye_coord + 1.0);

    // Sample the texture with the final UV coordinates
    FragColor = texture(image, final_uv);
}
