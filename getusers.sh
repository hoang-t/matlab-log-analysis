#!/bin/bash
#
# Given a FlexLM logfile, find the users which have used a certain feature
# example:  getusers.sh MATLAB lm_TMW.log
#

if [ $# -lt 2 ]; then
    echo Usage: $0 feature flexlm-logfile
    exit 0
else
    feature=$1
    logfile=$2
fi

declare -A featname
featname=(\
[MATLAB]="MATLAB" \
[SIMULINK]="Simulink" \
[Control_Toolbox]="Control System Toolbox" \
[GADS_Toolbox]="Global Optimization Toolbox" \
[Image_Toolbox]="Image Processing Toolbox" \
[MATLAB_Builder_for_Java]="MATLAB Compiler SDK" \
[Compiler]="MATLAB Compiler" \
[MAP_Toolbox]="Mapping Toolbox" \
[Neural_Network_Toolbox]="Neural Network Toolbox" \
[Optimization_Toolbox]="Optimization Toolbox" \
[Distrib_Computing_Toolbox]="Parallel Computing Toolbox" \
[Signal_Toolbox]="Signal Processing Toolbox" \
[Power_System_Blocks]="SimPowerSystems" \
[Simscape]="Simscape" \
[Simulink_Control_Design]="Simulink Control Design" \
[Statistics_Toolbox]="Statistics and Machine Learning Toolbox" \
[Symbolic_Toolbox]="Symbolic Math Toolbox" \
[Wavelet_Toolbox]="Wavelet Toolbox" \
)

### only users on Cypress (not including tuhpc... workshop accounts)
#uusers="$(grep " (MLM) OUT: \"${feature}\".*@cypress01-[0-9][0-9][0-9]$" ${logfile} | grep -v "tuhpc[0-9][0-9][0-9]@cypress01-[0-9][0-9][0-9]$" | awk '{print($NF)}' | awk -F\@ '{print($1)}' | sort | uniq -c)"
uusers="$(grep " (MLM) OUT: \"${feature}\".*@cypress01-[0-9][0-9][0-9]$" ${logfile} | grep -v "tuhpc[0-9][0-9][0-9]@cypress01-[0-9][0-9][0-9]$" | awk '{print($NF)}' | awk -F\@ '{print($1)}' | sort | uniq | sed 's/^/    /')"

#echo "DEBUG--now processing feature: [${feature}]"
nuusers=0
if [ ! -z "${uusers}" ]; then
    nuusers=$(echo "${uusers}" | wc -l)
    echo "${featname[$feature]} [ $nuusers ]"
    echo "${uusers}"
else
    echo "${featname[$feature]} [ $nuusers ]"
fi
echo ''    
