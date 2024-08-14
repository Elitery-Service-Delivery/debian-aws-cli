FROM debian:bookworm-slim

# May be optional if these packages are installed already in the base image
RUN apt update && apt install -y groff

COPY aws aws
RUN  ./aws/install

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["aws"]