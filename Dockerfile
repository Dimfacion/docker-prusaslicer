FROM debian
RUN mkdir -p /usr/src/
WORKDIR /usr/src/
RUN apt-get update && apt-get install -y \
  cmake \
  git \
  g++ \
  libboost-all-dev \
  libcereal-dev \
  libcurl4-openssl-dev \
  libgl1-mesa-dev \
  libpng-dev \
  libtbb-dev \
  make \
  pkg-config \
  zlib1g-dev
RUN git clone -b 'master' --single-branch --depth 1 https://github.com/prusa3d/PrusaSlicer.git
WORKDIR /usr/src/PrusaSlicer
RUN ls -la /usr/lib
RUN mkdir build \
  && cd build \
  && cmake /usr/src/PrusaSlicer \
  && make
ENTRYPOINT [ "/usr/src/CuraEngine/build/CuraEngine"] 
CMD ["help"]