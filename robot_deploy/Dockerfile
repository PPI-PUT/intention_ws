FROM dustynv/ros:humble-ros-base-l4t-r32.7.1

# install packages & setup locales
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libglib2.0-dev \
    wget \
    unzip \
    software-properties-common

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get update \
    && apt install -y gcc-9 g++-9 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100

RUN curl -L -o lcm-v1.4.0.tar.gz https://github.com/lcm-proj/lcm/archive/refs/tags/v1.4.0.tar.gz \
    && tar -xzvf lcm-v1.4.0.tar.gz \
    && rm lcm-v1.4.0.tar.gz \
    && cd lcm-1.4.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

RUN wget https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip \
    && unzip libtorch-shared-with-deps-latest.zip \ 
    && mv libtorch /usr/local/lib/libtorch \
    && rm libtorch-shared-with-deps-latest.zip
ENV Torch_DIR=/usr/local/lib/libtorch
RUN sed -i '819s|.*|auto value = std::optional<CallbackInfoVariant>{std::move(it->second.second)};|' /opt/ros/humble/install/include/rclcpp/rclcpp/client.hpp
    
WORKDIR /home
RUN git clone https://github.com/PPI-PUT/intention_ws.git \
    && cd intention_ws \
    && vcs import < deps.repos

COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]

CMD ["/bin/bash"]
LABEL maintainer="Maciej Krupka (maciej.p.krupka@student.put.poznan.pl)"
