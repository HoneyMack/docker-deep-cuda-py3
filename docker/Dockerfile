FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04
SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        wget \
        curl \
        git \
        vim \
        python3-pip \
        python3.8-venv \
        lsb-release \
        gnupg \
        avahi-autoipd \
        avahi-daemon \
        avahi-utils \
        libgl1-mesa-dev \
        libglib2.0-0 \
        libxrandr2 \
        libxcursor1 \
        libglfw3 \
        libglew2.1


# RUN source /root/.bashrc && \
#     pip install matplotlib && \
#     pip install torch torchvision torchaudio

# Copy the helper scripts to the working directory.
COPY ./docker/scripts/. /root/scripts/
RUN chmod -R +x /root/scripts/*

# container内のユーザを外部と揃えるための処理
COPY ./docker/scripts/.bashrc /home/
RUN chown 1000:1000 /home/.bashrc
RUN chown -R 1000:1000 /home

# # Force color prompt in terminal.
RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT []

CMD ["/bin/bash"]

