#!/bin/bash
module load matlab/2017a

mkdir -p compiled

cat > build.m <<END
addpath(genpath('/N/soft/rhel7/fsl/5.0.11b/bin/'))
addpath(genpath('/N/soft/rhel7/ants/2.3.1/bin/'))
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/soft/mason/SPM/spm8'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/project/plab/bacaron/git/mrQ'))
addpath(genpath('/N/project/plab/bacaron/git/knkutils'))
mcc -m -R -nodisplay -d compiled mrQBrainlife
exit
END
matlab -nodisplay -nosplash -r build
