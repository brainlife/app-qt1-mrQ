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
inputData_spgr.name = split(config.spgr_name)';
inputData_seir.name = split(config.seir_name);

% grab tr, te, flip angle, field strength, and it
inputData_spgr.TR = str2num(config.spgr_tr);
inputData_seir.TR = str2num(config.seir_tr);
inputData_spgr.TE = str2num(config.spgr_te);
inputData_seir.TE = str2num(config.seir_te);
inputData_spgr.flipAngle = str2num(config.spgr_flipangle);
inputData_spgr.fieldStrength = str2num(config.spgr_fieldstrength);
inputData_seir.IT = str2num(config.seir_it);

% grab reference image
refimage = fullfile(config.refImage);

% grab specific variables for mrQ
antsThrs = str2num(config.antsThrs);
autoacpc = str2num(config.autoacpc);
shiftB1 = str2num(config.shiftB1);

% run mrQ
mrQ_run(pwd,outDir,inputData_spgr,inputData_seir,[],{'autoacpc',autoacpc,'ref',refimage,'QuantAntsThresh',antsThrs,'ShiftB1',shiftB1})