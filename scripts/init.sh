#!/bin/bash

HERE="${0%/*}"

# set up variables
export bbwDir="$(realpath "$HERE/..")"
export mnc2Path="$MNIBASEPATH/bin"

# set template
export icbmTemplate=$bbwDir/spaces/tpl-icbm/tpl-icbm_desc-t1_tal_nlin_sym_09c_mask.mnc
cd $bbwDir

# add to paths
export PATH=$bbwDir:$bbwDir/scripts/:$mnc2Path/:$wbPath:$PATH
export MATLABPATH=$bbwDir/scripts/:$MATLABPATH