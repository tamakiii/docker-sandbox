FROM debian:10.5 AS mainline

# --

FROM mainline AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      less \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --

FROM base AS bsd

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bmake \
      build-essential \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --

FROM base AS tools

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      curl \
      wget \
      vim \
      dnsutils \
      procps \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --

FROM base AS build

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      automake \
      autoconf \
      autopoint \
      bison \
      gettext \
      gperf \
      texinfo \
      rsync \
      git \
      wget \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --
