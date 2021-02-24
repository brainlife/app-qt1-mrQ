function [] = mrQBrainlife()

% add paths
if ~isdeployed
    disp('loading paths for IUHPC')
    addpath(genpath('/N/u/brlife/git/vistasoft'))
    addpath(genpath('/N/soft/mason/SPM/spm12'))
    addpath(genpath('/N/u/brlife/git/jsonlab'))
    addpath(genpath('/N/u/brlife/git/mrQ'))
    addpath(genpath('/N/u/brlife/git/knkutils'))
end

% load config.json
config = loadjson('config.json');

% set up paths
inputData_spgr.rawDir = config.spgr;
inputData_seir.rawDir = config.seir;
outDir = fullfile(pwd,'results')
if ~isdir(outDir)
    mkdir(fullfile(outDir))
end

% grab data name substring
inputData_spgr.name = config.spgr_name;
inputData_seir.name = config.seir_name;

% grab tr, te, flip angle, field strength, and it
inputData_spgr.TR = config.spgr_tr;
inputData_seir.TR = config.seir_tr;
inputData_spgr.TE = config.spgr_te;
inputData_seir.TE = config.seir_te;
inputData_spgr.flipAngle = config.spgr_flipangle;
inputData_spgr.fieldStrength = config.spgr_fieldstrength;
inputData_seir.IT = config.seir_it;

% grab reference image
refimage = fullfile(config.refImage);

% grab specific variables for mrQ
antsThrs = config.antsThrs;
autoacpc = config.autoacpc;
shiftB1 = config.shiftB1;

% run mrQ
mrQ_run(pwd,outDir,inputData_spgr,inputData_seir,[],{'autoacpc',autoacpc,'ref',refimage,'QuantAntsThresh',antsThrs,'ShiftB1',shiftB1})