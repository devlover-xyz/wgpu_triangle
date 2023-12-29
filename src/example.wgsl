[[block]] struct Circle {
    center : vec2<f32>;
    radius : f32;
    color : vec4<f32>;
};

[[group(0), binding(0)]] var<uniform> circles : array<Circle, 2>;

@builtin(position) var<out> Position : vec4<f32>;
@builtin(vertex_idx) var<in> VertexIndex : u32;

struct VertexOutput {
    @builtin(position) position : vec4<f32>;
    @location(0) color : vec4<f32>;
};

@stage(vertex)
fn vertex_main(input : vec2<f32>) -> VertexOutput {
    var output : VertexOutput;
    output.position = vec4<f32>(input, 0.0, 1.0);
    output.color = circles[VertexIndex].color;
    return output;
}

@stage(fragment)
fn fragment_main(input : VertexOutput) -> @location(0) vec4<f32> {
    return input.color;
}

@stage(vertex)
fn vertex_main_1(input : vec2<f32>) -> VertexOutput {
    var output : VertexOutput;
    output.position = vec4<f32>(input + vec2<f32>(1.0, 0.0), 0.0, 1.0);
    output.color = circles[VertexIndex].color;
    return output;
}

@stage(fragment)
fn fragment_main_1(input : VertexOutput) -> location(0) vec4<f32> {
    return input.color;
}