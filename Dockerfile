FROM debian:bookworm-slim

# May be optional if these packages are installed already in the base image
RUN apt update && apt install -y unzip groff

COPY awscliv2.zip awscliv2.zip
RUN  unzip awscliv2.zip && \
	./aws/install

RUN rm -rf aws && \
    rm awscliv2.zip && \
    apt remove --purge -y unzip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["aws"]