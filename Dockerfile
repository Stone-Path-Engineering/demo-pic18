FROM ubuntu:24.04

# Starting point from Alex Fabre at https://github.com/AlexFabre/mplabx-xc8
LABEL author="Bailey Steinfadt"
LABEL description="Build MPLAB X projects with XC8"
LABEL org.opencontainers.image.description "Build MPLAB X projects with XC8"

ARG MPLABX_VERSION=6.20
ARG XC8_VERSION=2.46
ARG PACK_FAMILY=PIC18F-Q_DFP
ARG PACK_VERSION=1.25.433

# Install the dependencies
# See https://microchipdeveloper.com/install:mplabx-lin64
# https://packages.ubuntu.com/ for version pinning
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libc6:i386=2.39-0ubuntu8 \
    libx11-6:i386=2:1.8.7-1build1 \
    libxext6:i386=2:1.3.4-1build2 \
    libstdc++6:i386=14-20240412-0ubuntu1 \
    libexpat1:i386=2.6.1-2build1 \
    libusb-1.0-0-dev=2:1.0.27-1 \
    wget=1.21.4-1ubuntu4 \
    procps=2:4.0.4-4ubuntu3 \
    sudo=1.9.15p5-3ubuntu5 \
    unzip=6.0-28ubuntu4 \
    make=4.3-4.1build2 && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Download and install MPLAB X without IPE or any DFP packs or compilers
RUN wget -nv -O mplabx "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/MPLABX-v${MPLABX_VERSION}-linux-installer.tar" --no-check-certificate --referer https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide &&\
    tar -xf mplabx && \
    rm mplabx && \
    mv "MPLABX-v${MPLABX_VERSION}-linux-installer.sh" mplabx && \
    sudo ./mplabx --nox11 -- --unattendedmodeui none --mode unattended --ipe 0 --8bitmcu 0 --16bitmcu 0 --32bitmcu 0 --othermcu 0 --collectInfo 0 --collectMyMicrochipInfo 0 --installdir /opt/mplabx && \
    rm mplabx

# Add mplab tools to PATH
ENV PATH $PATH:/opt/mplabx/mplab_platform/bin/

# Download and install XC8
RUN wget -nv -O /tmp/xc8 "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc8-v${XC8_VERSION}-full-install-linux-x64-installer.run" --no-check-certificate && \
    chmod +x /tmp/xc8 && \
    /tmp/xc8 --mode unattended --unattendedmodeui none --netservername localhost --LicenseType FreeMode --prefix "/opt/microchip/xc8/v${XC8_VERSION}" && \
    rm /tmp/xc8

# Add xc8-cc to PATH
ENV PATH $PATH:/opt/microchip/xc8/v${XC8_VERSION}/bin

# Download and install appropriate pack
# https://packs.download.microchip.com/ 
# https://developerhelp.microchip.com/xwiki/bin/view/software-tools/x/projects/packs/dfps-introduction/#HUsingDFPsWithaStandaloneCompiler
RUN wget -nv -O /tmp/pack "https://packs.download.microchip.com/Microchip.${PACK_FAMILY}.${PACK_VERSION}.atpack" --no-check-certificate && \
    mkdir -p /opt/mplabx/packs/Microchip/${PACK_FAMILY}/${PACK_VERSION} && \
    unzip /tmp/pack -d /opt/mplabx/packs/Microchip/${PACK_FAMILY}/${PACK_VERSION} && \
    rm /tmp/pack


# Uninstall? Check after testing above works
#opt/microchip/mplabcomm/3.53.00/MPLABCOMM-3.53.00-linux-installer.run
#opt/mplabx/Uninstall_MPLAB_X_IDE_v6.20
#opt/mplabx/Uninstall_MPLAB_X_IDE_v6.20.desktop
#opt/mplabx/Uninstall_MPLAB_X_IDE_v6.20.dat
#opt/mplabx/docs/*
#opt/mplabx/mplab_platform/alexandriaoffline/*
#opt/microchip/xc8/v2.46/Uninstall-xc8-v2.dat
#opt/microchip/xc8/v2.46/Uninstall-xc8-v2.46 
#'opt/microchip/xc8/v2.46/Uninstall MPLAB XC8 C Compiler.desktop'
#opt/microchip/xc8/v2.46/docs/*
