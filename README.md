[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-brainlife.app.481-blue.svg)](https://doi.org/10.25663/brainlife.app.481)

# Fit qT1 models using mrQ

This app will fit a quantitative model to qT1 data using mrQ following methodologies outlined in Mezer et al (2013)

### Authors

- Brad Caron (bacaron@utexas.edu)

### Contributors

- Soichi Hayashi (shayashi@iu.edu)

### Funding Acknowledgement

brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations

We kindly ask that you cite the following articles when publishing papers and code using this code.

1. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). https://doi.org/10.1038/s41597-019-0073-y

2. Mezer, A., Yeatman, J., Stikov, N. et al. Quantifying the local tissue volume and composition in individual brains with magnetic resonance imaging. Nat Med 19, 1667–1672 (2013). https://doi.org/10.1038/nm.3390

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University

## Running the App

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.481](https://doi.org/10.25663/brainlife.app.481) via the 'Execute' tab.

### Running Locally (on your machine)

1. git clone this repo

2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "spgr": "/input/spgr/",
    "seir": "/input/seir/",
    "refImage": "/input/refImage/t1.nii.gz",
    "spgr_name": "spgr",
    "seir_name":  "seir",
    "antsThrs": 0.8,
    "autoacpc": 0,
    "shiftB1": 0,
    "spgr_tr": "0.1 0.1 0.1",
    "seir_tr": "0.1 0.1 0.1",
    "spgr_te": "0.1 0.1 0.1",
    "seir_te": "0.1 0.1 0.1",
    "spgr_flipangle": "45 45 45",
    "spgr_fieldstrength": "3 3 3",
    "seir_it": "1 1 1"
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download
```

3. Launch the App by executing 'main'

```bash
./main
```

## Output

The main output of this App is a raw qt1 datatype.

#### Product.json

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing.

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.   

- matlab: https://www.mathworks.com/products/matlab.html
- mrQ: https://github.com/mezera/mrQ
- vistasoft: https://github.com/vistalab/vistasoft
- spm: https://www.fil.ion.ucl.ac.uk/spm/software/spm12/
- jsonlab: https://github.com/fangq/jsonlab
- knkutils: https://github.com/cvnlab/knkutils

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University
