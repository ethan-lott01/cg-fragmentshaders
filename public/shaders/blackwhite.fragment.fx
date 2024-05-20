#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);

    // Calculate Luminance
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    FragColor = vec4(vec3(gray), color.a);
}