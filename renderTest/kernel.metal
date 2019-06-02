
#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> // includes CIKernelMetalLib.h

extern "C" { namespace coreimage {
    float4 myKernel (sampler src) {
        float2 c = src.coord();
        float4 s = src.sample(c);
        if (c.x < 100 && c.y < 100) {
            return float4(1.0);
        }
        return s;
    }
} }
