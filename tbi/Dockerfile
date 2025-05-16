ARG BASE_UBI=almalinux:9
FROM $BASE_UBI

COPY setup /setup
ENV PATH=/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin/:/tyk-scripts/python:/tyk-scripts/bastion

RUN chmod +x /setup/os-setup && /setup/os-setup

ENTRYPOINT ["/usr/bin/sleep", "infinity"]
