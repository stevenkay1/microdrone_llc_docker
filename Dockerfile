FROM ubuntu:16.04

LABEL mbed-cli development environment for microdrone_llc firmware project, Owner Steven Kay (skay@gmv.com)

WORKDIR /

RUN apt-get update && apt-get install -y \
	bzip2 \
	git \
	nano \
	mercurial \
	doxygen \
	python-pip \
	python-setuptools \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# TODO: check version of gcc-arm-none-eabi when selected new NUCLEO dev board
ADD https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2?revision=2cc92fb5-3e0e-402d-9197-bdfc8224d8a5?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,6-2017-q2-update /

#TODO: update once compiler version selected
RUN tar xf gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 && rm gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2

RUN pip install --upgrade pip

#TODO: add "&& mbed config -G GCC_ARM_PATH /<path_version>" once version selected
RUN pip install mbed-cli

#TODO: add github clone to microdrone_llc firmware project
RUN git clone https://github.com/stevenkay1/microdrone_llc.git

WORKDIR /microdrone_llc

RUN git pull
