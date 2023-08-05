# Get docker image
FROM ubuntu:22.04

# install neccessary packages for build
RUN DEBIAN_FRONTEND=noninteractive \
   apt-get update \
   && apt-get install -yq apt-utils \
   python-is-python3 \
   python3-distutils \
   xz-utils \
   libtinfo5 \
   git \
   locales \ 
   curl \
   wget \
   sudo \ 
   binutils \ 
   bzip2 \ 
   chrpath \ 
   cpio \ 
   cpp \ 
   diffstat \ 
   file \ 
   g++ \ 
   g++-multilib \
   gcc-multilib \
   git-core \
   socat \
   unzip \
   texinfo \
   python2 \
   gawk \ 
   lz4 \ 
   make \ 
   zstd

# cleanup apt caches
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# define locales for build configurations
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# add user
RUN useradd -ms /bin/bash yocto && echo "yocto:xilinx" | chpasswd && adduser yocto sudo

# download repo tool from google
RUN wget https://storage.googleapis.com/git-repo-downloads/repo -O /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo

# create work directory
RUN mkdir /home/yocto/projects
RUN mkdir /home/yocto/layers
RUN chown yocto:yocto -R /home/yocto/projects
RUN chown yocto:yocto -R /home/yocto/layers

# switch to yocto account
USER yocto

# set default docker path
WORKDIR /home/yocto/projects

CMD ["sleep", "infinity"]
