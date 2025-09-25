### Build FastSD CPU
ARG BUILD_FROM
FROM $BUILD_FROM

# Packages
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
       python3 \
       python3-pip \
       git \
       nginx \
       ffmpeg \
    && apt-get clean \
    && rm -fr \
       /tmp/* \
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
