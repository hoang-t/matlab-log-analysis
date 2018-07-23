#!/bin/bash

if [ $# -lt 1 ]; then
    echo Usage: $0 lmlogfile
    exit 0
else
    lmlogfile=$1
fi

features="MATLAB \
SIMULINK \
Control_Toolbox \
GADS_Toolbox \
Image_Toolbox \
MATLAB_Builder_for_Java \
Compiler \
MAP_Toolbox \
Neural_Network_Toolbox \
Optimization_Toolbox \
Distrib_Computing_Toolbox \
Signal_Toolbox \
Power_System_Blocks \
Simscape \
Simulink_Control_Design \
Statistics_Toolbox \
Symbolic_Toolbox \
Wavelet_Toolbox"

for feature in $features; do
    ./getusers.sh ${feature} ${lmlogfile}
done
