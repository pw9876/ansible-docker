ARG ANSIBLE_CORE_VERSION=2.17.7
ARG ALPINE_VERSION=3.21

FROM alpine:${ALPINE_VERSION}

ARG ANSIBLE_CORE_VERSION

RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    openssh-client \
    bash \
    ca-certificates \
    rsync \
    sshpass \
    && update-ca-certificates \
    && pip3 install --no-cache-dir --break-system-packages \
       "ansible-core==${ANSIBLE_CORE_VERSION}" \
    && ansible --version

WORKDIR /workspace

ENTRYPOINT ["ansible"]
CMD ["--version"]
