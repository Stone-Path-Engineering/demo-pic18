# PIC18 Demo Project

Blinks the built-in LED on the Curiosity Nano PIC18F57Q84 board using a timer interrupt.

Used [Microchip Example](https://github.com/microchip-pic-avr-examples/pic18f57q43-blink-with-timer-mplab-mcc) for a similar board as a starting point.

Want to get working with a UART as well. May use [this example](https://github.com/microchip-pic-avr-examples/pic18f57q43-dma-uart-echo-mplab-mcc)

Build script example

```bash
#!/bin/bash

echo "Building project $1:$2"

xc8-cc --version

set -x -e

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh "timer-blink.X@default" || exit 1
make -C "timer-blink.X" CONF="default" build || exit 2
```
