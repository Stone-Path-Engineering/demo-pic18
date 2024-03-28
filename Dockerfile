FROM debian:bookworm

# Starting point from Alex Fabre at https://github.com/AlexFabre/mplabx-xc8
LABEL author="Bailey Steinfadt"
LABEL description="Build MPLAB X projects with XC8"
LABEL org.opencontainers.image.description "Build MPLAB X projects with XC8"

ARG MPLABX_VERSION=6.20
ARG XC8_VERSION=2.46
ARG PACK_VERSION=

# Install the dependencies
# See https://microchipdeveloper.com/install:mplabx-lin64
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libc6:i386 libx11-6:i386 libxext6:i386 libstdc++6:i386 libexpat1:i386 \
    libusb-1.0-0-dev wget procps sudo make && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Download and install XC8
RUN wget -nv -O /tmp/xc8 "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc8-v${XC8_VERSION}-full-install-linux-x64-installer.run" && \
    chmod +x /tmp/xc8 && \
    /tmp/xc8 --mode unattended --unattendedmodeui none --netservername localhost --LicenseType FreeMode --prefix "/opt/microchip/xc8/v${XC8_VERSION}" && \
    rm /tmp/xc8

# Add xc8-cc to PATH
ENV PATH $PATH:/opt/microchip/xc8/v${XC8_VERSION}/bin

# Download and install MPLAB X
RUN wget -nv -O /tmp/mplabx "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/MPLABX-v${MPLABX_VERSION}-linux-installer.tar" --no-check-certificate --referer https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide &&\
    cd /tmp && \
    tar -xf mplabx && \
    rm mplabx && \
    mv "MPLABX-v${MPLABX_VERSION}-linux-installer.sh" mplabx && \
    sudo ./mplabx --nox11 -- --unattendedmodeui none --mode unattended --ipe 0 --collectInfo 0 --installdir /opt/mplabx && \
    rm mplabx



# Add mplab tools to PATH
ENV PATH $PATH:/opt/mplabx/mplab_platform/bin/

# Validate installation
RUN echo 'Validate xc8 location' && which xc8-cc && \
    echo 'Validate xc8 version' && xc8-cc --version
