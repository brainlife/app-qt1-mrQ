#!/bin/bash
module load matlab/2017a

mkdir -p compiled

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/soft/mason/SPM/spm8'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/project/plab/bacaron/git/mrQ'))
addpath(genpath('/N/project/plab/bacaron/git/knkutils'))
mcc -m -R -nodisplay -d compiled main
exit
END
matlab -nodisplay -nosplash -r build
