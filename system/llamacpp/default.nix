{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.llama-cpp-vulkan
  ];
  
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    # package = (pkgs.llama-cpp.override { cudaSupport = true; })
    # package = pkgs.llama-cpp-rocm;

    # Takes care of downloading if model not present
    settings.models-preset = (pkgs.formats.ini { }).generate "models.presets.ini" {
      "Qwen3.8-27B" = {
        # verbose = "true";
        hf-repo = "unsloth/Qwen3.8-27B-GGUF";
        hf-file = "Qwen3.8-27B-UD-Q4_K_M.gguf";
        alias = "unsloth/Qwen3.8-27B-GGUF";
        ctx-size = "131072";
        cache-type-k = "q8_0";
        cache-type-v = "q5_1";
        no-mmproj = "true";
        temp = "1.0";
        top-p = "0.95";
        top-k = "20";
        min-p = "0.0";
        presence-penalty = "0.0";
        repeat-penalty = "1.0";
        # spec-type = "draft-mtp";
        # spec-draft-n-max = "3";
        reasoning = "on";
        reasoning-effort = "medium"; 
      };
      /*"Qwen2.5-Coder-1.5B-Instruct" = {
        # verbose = "true";
        hf-repo = "Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF";
        hf-file = "qwen2.5-coder-1.5b-instruct-q4_k_m.gguf";
        alias = "Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF";
        ctx-size = "8192";
        temp = "0.7";
        top-p = "0.8";
        top-k = "20";
        min-p = "0.0";
        presence-penalty = "1.5";
        repeat-penalty = "1.0";
      };*/
    };
  };

  systemd.services.llama-cpp = {
    environment = {
      XDG_CACHE_HOME = "/var/cache/llama-cpp";
      MESA_SHADER_CACHE_DIR = "/var/cache/llama-cpp";
    };
  };
}