FROM ubuntu:16.04

LABEL mbed-cli Dockerimage for microdrone project, Owner Steven Kay (skay@gmv.com)

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

ADD https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2?revision=2cc92fb5-3e0e-402d-9197-bdfc8224d8a5?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,6-2017-q2-update /

RUN tar xf gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 && rm gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2

RUN pip install --upgrade pip

RUN pip install mbed-cli

