# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
# Skipping installation for jameswalker-nodes -- not available in ComfyUI registry (registryStatus: false)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/tianweiy/DMD2/resolve/main/dmd2_sdxl_4step_lora.safetensors --relative-path models/loras --filename dmd2_sdxl_4step_lora.safetensors
RUN comfy model download --url https://huggingface.co/Kim2091/UltraSharp/resolve/main/4x-UltraSharp.pth --relative-path models/upscale_models --filename 4x-UltraSharp.pth
# RUN # Could not find URL for Perfection_ILXL_Realistic_4.0.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
