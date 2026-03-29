ARG ANSIBLE_CORE_VERSION=2.17.7
ARG ALPINE_VERSION=3.21

FROM alpine:${ALPINE_VERSION}

ARG ANSIBLE_CORE_VERSION

RUN apk add --no-cache \
    bash \
    ca-certificates \
    git \
    openssh-client \
    py3-pip \
    python3 \
    rsync \
    sshpass \
    && update-ca-certificates \
    && pip3 install --no-cache-dir --break-system-packages \
       "ansible-core==${ANSIBLE_CORE_VERSION}" \
    && ansible --version \
    && adduser -D ansible

WORKDIR /workspace

USER ansible

ENTRYPOINT ["ansible"]
CMD ["--version"]
