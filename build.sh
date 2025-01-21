#!/bin/bash

# TODO: take input for release vs debug build
prjMakefilesGenerator.sh timer-blink.X
make -C timer-blink.X CONF=release build CFLAGS="-mdfp=/opt/mplabx/packs/Microchip/$PACK_FAMILY/$PACK_VERSION"