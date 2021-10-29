#!/bin/bash
#PBS -l walltime=10:00:00,nodes=1:ppn=10
#PBS -o out-2-2.file
#PBS -t 1-30
#---------------------------------------------

date


cd $PBS_O_WORKDIR

cd ../../

# get settings
settingLine=${PBS_ARRAYID}

rsqC=`cat jobs/settings.txt | sed -n ${settingLine}p | cut -d, -f1`
rsqS=`cat jobs/settings.txt | sed -n ${settingLine}p | cut -d, -f2`
covarsInc=`cat jobs/settings.txt | sed -n ${settingLine}p | cut -d, -f3`

module add languages/R-4.0.3-gcc9.1.0


export RES_DIR="${HOME}/2021-randomization-test/results"


ncs=2
ncnots=2
ivEffect=0.05


# ncs ncnots rc rSelection iveffect grsVSsnp covarsIncluded allSample
Rscript sim-selection.R $ncs $ncnots $rsqC $rsqS $ivEffect "grs" $covarsInc 0

date

