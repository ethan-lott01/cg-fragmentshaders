#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate texture coordinate to the range [-1.0, 1.0]
    vec2 coord = model_uv * 2.0 - 1.0;

    // Calculate radius
    float radius = length(coord);

    // Calculate texture coordinate offset based on ripple effect
    vec2 offset = coord * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;

    // Calculate final texture coordinate
    vec2 final_uv = model_uv + offset;

    // Sample texture with final UV coordinates
    FragColor = texture(image, final_uv);
}
