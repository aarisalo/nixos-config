{ pkgs, ... }:

{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    # package = (pkgs.llama-cpp.override { cudaSupport = true; })
    # package = pkgs.llama-cpp-rocm;

    # Takes care of downloading if model not present
    settings.models-preset = (pkgs.formats.ini { }).generate "models.presets.ini" {
      # Requires 16.5GB VRAM 
      "Qwen3.8-27B" = {
        hf-repo = "unsloth/Qwen3.8-27B-GGUF";
        hf-file = "Qwen3.8-27B-UD-Q4_K_M.gguf";
        alias = "unsloth/Qwen3.8-27B-GGUF";
        temp = "1.0";
        top-p = "0.95";
        top-k = "20";
        min-p = "0.0";
        presence-penalty = "0.0";
        repeat-penalty = "1.0";
      };
      # Requires 4GB VRAM 
      "Qwen2.5-Coder-3B-Instruct" = {
        hf-repo = "Qwen/Qwen2.5-Coder-3B-Instruct-GGUF";
        hf-file = "qwen2.5-coder-3b-instruct-q8_0.gguf";
        alias = "Qwen/Qwen2.5-Coder-3B-Instruct-GGUF";
        temp = "0.7";
        top-p = "0.8";
        top-k = "20";
        repeat-penalty = "1.0";
      };
    };
  };

  systemd.services.llama-cpp = {
    environment = {
      XDG_CACHE_HOME = "/var/cache/llama-cpp";
      MESA_SHADER_CACHE_DIR = "/var/cache/llama-cpp";
      LLAMA_API_KEY = "llamacpp4mMit15nr73z4p5nmZ7271gKrfOfB6sF";
    };
  };
}
