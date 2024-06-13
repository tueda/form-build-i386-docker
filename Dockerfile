FROM i386/debian:bookworm

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    automake=1:1.16.* \
    g++=4:12.2.* \
    git=1:2.39.* \
    libflint-dev=2.9.* \
    libgmp-dev=2:6.2.* \
    libmpfr-dev=4.2.* \
    make=4.3-4.* \
    ruby=1:3.1* \
    zlib1g-dev=1:1.2.* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user
WORKDIR /workspace
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
