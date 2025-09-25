#!/usr/bin/with-contenv bashio

# ==============================================================================
# Home Assistant Fast SD CPU Add-on
# Displays a simple add-on banner on startup
# ==============================================================================

bashio::log.info 'FastSD CPU Starting...'
if bashio::config.true 'ui_mode'; then
  bashio::log.blue "  In Web UI Mode"
else
  bashio::log.blue "  In API Mode"
fi
if bashio::config.has_value 'log_level'; then
  export LOG_LEVEL=$(bashio::config 'log_level')
fi
bashio::log.info

# ==============================================================================

bashio::color.reset
if bashio::config.true 'ui_mode'; then
  ./start-webui.sh
else
  ./start-webserver.sh
fi
bashio::color.reset

# ==============================================================================

bashio::log.info
bashio::log.info 'FastSD CPU Stop'
bashio::exit.ok
