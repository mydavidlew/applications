#!/bin/sh
# NVIDIA Fan Control Settings
# /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
# /usr/bin/nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=40"
sh -c 'sudo /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=40"'
