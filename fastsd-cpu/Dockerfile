### Build FastSD CPU
ARG BUILD_FROM
FROM $BUILD_FROM

# Packages
RUN \
    apt-get update \
    && apt-get install --no-install-recommends -y \
       python3 \
       python3-pip \
       git \
       nginx \
       ffmpeg

RUN \
    apt-get update \
    && apt-get  install --no-install-recommends -q -y \
       wget \
       ocl-icd-libopencl1 \
       intel-opencl-icd

# Intel GPU compute user-space drivers
RUN \
    mkdir -p /tmp/gpu && \
    cd /tmp/gpu && \
    echo "Downloading oneAPI Level Zero Loader v1.24.2..." && \
    wget https://github.com/oneapi-src/level-zero/releases/download/v1.24.2/level-zero_1.24.2+u24.04_amd64.deb && \
    echo "Downloading Intel Graphics Compiler v2.16.0..." && \
    wget https://github.com/intel/intel-graphics-compiler/releases/download/v2.16.0/intel-igc-core-2_2.16.0+19683_amd64.deb && \
    wget https://github.com/intel/intel-graphics-compiler/releases/download/v2.16.0/intel-igc-opencl-2_2.16.0+19683_amd64.deb && \
    echo "Downloading Intel Compute Runtime v25.31..." && \
    wget https://github.com/intel/compute-runtime/releases/download/25.31.34666.3/intel-ocloc_25.31.34666.3-0_amd64.deb && \
    wget https://github.com/intel/compute-runtime/releases/download/25.31.34666.3/intel-opencl-icd_25.31.34666.3-0_amd64.deb && \
    wget https://github.com/intel/compute-runtime/releases/download/25.31.34666.3/libigdgmm12_22.8.1_amd64.deb && \
    wget https://github.com/intel/compute-runtime/releases/download/25.31.34666.3/libze-intel-gpu1_25.31.34666.3-0_amd64.deb && \
    dpkg -i --force-all *.deb && \
    rm *.deb

# Clean up APT when done.
RUN \
    apt-get clean \
    && rm -fr \
       /tmp/* \
       /var/tmp/* \
       /var/cache/* \
       /var/lib/apt/lists/* \
       /var/log/*.log \
       /var/log/apt

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# FastSD CPU
RUN \
  git clone --depth 1 https://github.com/rupeshs/fastsdcpu /app

WORKDIR /app

COPY app .

RUN \
  rm *.bat \
  && chmod +x install.sh \
  && echo "" | ./install.sh --disable-gui

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Add Label
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Andrew J.Swan <andrewjswan@addons.community>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Andrew J.Swan" \
    org.opencontainers.image.authors="Andrew J.Swan <andrewjswan@addons.community>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/master/README.md"

WORKDIR /

# Copy root filesystem
COPY rootfs /

# Make scripts executable
RUN chmod a+x $(find "./" -type f -iname "*.sh")
RUN chmod a+x $(find "./app" -type f -iname "*.sh")
RUN chmod a+x $(find "./etc/services.d" -type f -iname "*")

# Port
EXPOSE 8000

WORKDIR /app

# Start FastSD CPU
ENV GRADIO_SERVER_PORT=8000
ENV GRADIO_SERVER_NAME=0.0.0.0

CMD [ "./run.sh" ]
