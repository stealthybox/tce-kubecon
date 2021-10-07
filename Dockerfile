FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

USER root

RUN curl -L https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.42.0/kapp-linux-amd64 --output kapp \
    && chmod +x kapp \
    && mv kapp /opt/kubernetes/bin/kapp

USER 1001

RUN curl -L https://github.com/vmware-tanzu/community-edition/releases/download/v0.9.1/tce-linux-amd64-v0.9.1.tar.gz --output tce-linux-amd64-v0.9.1.tar.gz \
    && tar xzvf /home/eduk8s/tce-linux-amd64-v0.9.1.tar.gz \
    && mkdir -p ~/bin \
    && tce-linux-amd64-v0.9.1/install.sh \
    && rm -rf tce-linux-amd64*

RUN fix-permissions /home/eduk8s
