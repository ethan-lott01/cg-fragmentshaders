#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

// Function to round color components to nearest level
vec3 toonify(vec3 color) {
    // Multiply by 4, round to nearest integer, then divide by 4
    return floor(color * 4.0 + 0.5) / 4.0;
}

void main() {
    // Sample original color from texture
    vec4 color = texture(image, model_uv);

    // Apply the toonify function to RGB
    vec3 toonColor = toonify(color.rgb);

    // Output color with toonified RGB and original alpha
    FragColor = vec4(toonColor, color.a);
}
