#! /bin/sh

if [[ -z "${BITCOIN_REPO}" ]]; then
    echo "Please set \$BITCOIN_REPO"
    exit 0
fi

# maps bitcoin repo core repo to /bitcoin
# maps qa-assets repo to /qa-assets
# Uses 3GB ram
# Uses 3 cpu cores
# Ptrace and security options allow lldb to work inside docker
docker run -i -t -v ${BITCOIN_REPO}:/bitcoin -m 3g --cpus=3 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --security-opt apparmor=unconfined bitcoin-testing bash

