FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

USER root

RUN tar xzvf /home/eduk8s/tce-linux-amd64-v0.7.0.tar.gz
RUN tce-linux-amd64-v0.7.0/install.sh

USER 1001
RUN fix-permissions /home/eduk8s

