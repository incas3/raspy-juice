#!/bin/bash

make

PORT="usb"

PART="atmega328p"

BAUD="57600"

PROG="avrispmkii"

avrdude -c$PROG -P$PORT -p$PART -b$BAUD -U lfuse:w:0xe2:m -U hfuse:w:0xd8:m -U efuse:w:0x07:m -U lock:w:0x3F:m -U flash:w:twiboot.hex:i -U lock:w:0x0F:m