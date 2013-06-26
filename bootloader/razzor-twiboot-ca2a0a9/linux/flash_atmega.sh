#!/bin/sh
#This is a script to flash the atmega on the beaglebone black 
#usb extention board. Reset is connected to Pin 12 of P9. 
#Pin 12 of P9 is GPIO1_28, which leads to (28 + 32) = 60.
PIN=60

FIRMWARE=$1

GPIO_PATH=/sys/class/gpio
RSTPIN_PATH=$GPIO_PATH/gpio$PIN/

echo "Toggling reset pin"
echo $PIN > $GPIO_PATH/export 2> /dev/null
echo out > $RSTPIN_PATH/direction

echo 1 > $RSTPIN_PATH/value
echo 0 > $RSTPIN_PATH/value
echo 1 > $RSTPIN_PATH/value
sleep 1

ADDRESS=0x29
DEVICE=/dev/i2c-1
echo "flashing $FIRMWARE to $ADDRESS @ $DEVICE"
twiboot -p 2 -a $ADDRESS -d $DEVICE -w flash:$FIRMWARE

