#!/bin/bash
# perform nonlinear transformation from ICBM2009c nonlinear symmetric to BigBrain Histological space
# written by Casey Paquola @ MICA, MNI, 2020*

# requires minc2

fileName=$1 		# name of input file without extension. Must be a .mnc file. (Try nii2mnc if your data is nifti)
			# output is in form ${fileName}_bigbrain.mnc
bbSpace=$2 		# which bigbrain space to output to: "histological" or "sym"
interp=$3		# "linear" (smooth data) or "nearest_neighbour" (discrete data)
bbwDir=$4		# /path/to/BigBrainWarp/


/data_/mica1/01_programs/minc2/mincresample -transformation ${bbwDir}/xfms/BigBrain-to-ICBM2009sym-nonlin.xfm -invert_transformation -tfm_input_sampling -$interp ${fileName}.mnc ${fileName}_nl.mnc
if [[ $bbSpace=histological ]] ; then
	/data_/mica1/01_programs/minc2/mincresample -transformation ${bbwDir}/xfms/bigbrain_to_icbm2009b_nl.xfm -invert_transformation -tfm_input_sampling -$interp ${fileName}_nl.mnc ${fileName}_nl_nl.mnc
	/data_/mica1/01_programs/minc2/mincresample -transformation ${bbwDir}/xfms/bigbrain_to_icbm2009b_lin.xfm -invert_transformation -tfm_input_sampling -$interp ${fileName}_nl_nl.mnc ${fileName}_bigbrain.mnc
else
	mv ${fileName}_nl.mnc ${fileName}_bigbrain.mnc
end
rm -rf *nl.mnc

