#!/bin/bash
hp=$(bash -c 'pactl list sinks | grep "Aktiver Port: analog-output-headphones"')
lo=$(bash -c 'pactl list sinks | grep "Aktiver Port: analog-output-lineout"')

if [ -z "$lo" ]
then
  pactl set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-lineout
elif [ -z "$hp" ]
then
  pactl set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-headphones
fi
