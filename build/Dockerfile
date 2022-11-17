FROM pla10/ros2_humble:amd64

ARG DEBIAN_FRONTEND=noninteractive

ENV SHARED_DIR=/root/shared

RUN apt install -y wget gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    apt remove -y wget gpg && \
    apt install -y apt-transport-https && \
    apt update && \
    apt install -y code && \
    apt autoremove -y

RUN apt update && \
    apt upgrade -y && \
    apt install -y git nano && \
    apt autoremove -y

COPY ./.bashrc /root

ENTRYPOINT [ "/ros_entrypoint.sh" ]
CMD [ "bash" ]