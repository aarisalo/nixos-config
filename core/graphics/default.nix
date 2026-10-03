{ config, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # hardware.amdgpu.overdrive.enable = true;
    hardware.amdgpu.overdrive.ppfeaturemask = "0xfff7ffff";
}