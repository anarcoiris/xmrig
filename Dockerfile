FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
    git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && mkdir build && cd build && \
    cmake .. && make -j$(nproc)

WORKDIR /xmrig/build

ENTRYPOINT ["./xmrig"]
