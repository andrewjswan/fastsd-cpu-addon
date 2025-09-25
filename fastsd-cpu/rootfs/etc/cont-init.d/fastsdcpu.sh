#!/usr/bin/with-contenv bashio

# ==============================================================================

bashio::log.info 'FastSD CPU Configuration'
if [ -d "/addon_configs/fastsd-cpu" ]; then
  bashio::log.blue "  Configuration found"
else
  bashio::log.blue "  Configuration not found, creating a base configuration..."
  mkdir -p /addon_configs/fastsd-cpu
  cp -r /app/configs/* /addon_configs/fastsd-cpu/
fi
rm -rf /app/configs
ln -s /addon_configs/fastsd-cpu /app/configs

bashio::log.info 'FastSD CPU Share'
mkdir -p /share/fastsd-cpu

bashio::log.blue '  - Lora models'
rm -rf /app/lora_models
mkdir -p /share/fastsd-cpu/lora_models
ln -s /share/fastsd-cpu/lora_models /app/lora_models

bashio::log.blue '  - Controlnet models'
rm -rf /app/controlnet_models
mkdir -p /share/fastsd-cpu/controlnet_models
ln -s /share/fastsd-cpu/controlnet_models /app/controlnet_models

bashio::log.blue '  - Results'
rm -rf /app/results
mkdir -p /share/fastsd-cpu/results
ln -s /share/fastsd-cpu/results /app/results

bashio::color.reset
