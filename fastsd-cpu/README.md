<div align="center">
<h1>FastSD CPU Add-on</h1>
</div>

## General

[![ha addon_badge](https://img.shields.io/badge/HA-Addon-blue.svg)](https://developers.home-assistant.io/docs/add-ons)
[![FastSD CPU](https://img.shields.io/badge/FastSD-CPU-blue.svg)](https://github.com/andrewjswan/fastsd-cpu-addon/)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/andrewjswan/fastsd-cpu-addon/build.yml?logo=github)](https://github.com/andrewjswan/fastsd-cpu-addon/actions)
[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/andrewjswan/fastsd-cpu-addon?include_prereleases)](https://github.com/andrewjswan/fastsd-cpu-addon/blob/master/fastsd-cpu/CHANGELOG.md)
[![GitHub License](https://img.shields.io/github/license/andrewjswan/fastsd-cpu-addon?color=blue)](https://github.com/andrewjswan/fastsd-cpu-addon/blob/master/LICENSE)
[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

**FastSD CPU** - FastSD CPU is a faster version of Stable Diffusion on CPU. Based on [Latent Consistency Models](https://github.com/luosiallen/latent-consistency-model) and [Adversarial Diffusion Distillation](https://nolowiz.com/fast-stable-diffusion-on-cpu-using-fastsd-cpu-and-openvino/).

## Architecture

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports armhf Architecture][armhf-shield] ![Supports i386 Architecture][i386-shield]

## Confururation settings

- `ui_mode`: Run FastSD CPU in Web UI mode or API mode.

### Default confururation
```
  ui_mode: false    # Optional
  log_level: DEBUG  # Optional, values: DEBUG|INFO|WARNING|ERROR|CRITICAL
```

## Folders

- `addon_configs/fastsd-cpu`: Configuration folder

- `share/fastsd-cpu`: Models and results folder

> [!TIP]
> **FastSD CPU** API mode documentation available at the **http://homeassistant.local:8000/api/docs**.

> [!TIP]
> **FastSD CPU** [Documentation](https://github.com/rupeshs/fastsdcpu).

> [!NOTE]
> **FastSD CPU** add-on based on [FastSD CPU](https://github.com/rupeshs/fastsdcpu).

[amd64-shield]: https://img.shields.io/badge/amd64-yes-blue.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-blue.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
